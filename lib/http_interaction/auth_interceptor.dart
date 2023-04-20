import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'secure_storage_tokens.dart';

enum TokenErrorType { failedToRegenerateAccessToken, refreshTokenHasExpired }

class AuthInterceptor extends Interceptor {
  //! this interceptor was not tested yet
  final Dio _dio;
  // TODO: inject secureStorage
  late final SecureStorageTokens
      _localStorage; // Here we storage our refrech token

  AuthInterceptor(this._dio);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
      // for some reasons the token can be invalidated before it is expired by the backend.
      // then we should navigate the user back to login page

      _performLogout(_dio);
      // TODO: navigate to login page
      // create custom dio error
      // err.type = DioErrorType.other;
      // err.requestOptions.extra["tokenErrorType"] = TokenErrorType.invalidAccessToken;
    }

    return handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers["requiresToken"] == false) {
      return _removeAuxiliaryRequierTokenHeader(options, handler);
    }

    //! method for get access tokens from local storage now doesn't work
    final accessToken = _localStorage.accessToken;
    final refreshToken = await _localStorage.refreshToken;

    if (accessToken == null || refreshToken == null) {
      return _allTokensNullOnRequest(options, handler);
    }

    var refreshed = true;

    final accessTokenHasExpired = JwtDecoder.isExpired(accessToken);
    final refreshTokenHasExpired = JwtDecoder.isExpired(refreshToken);
    if (refreshTokenHasExpired) {
      return _refreshTokenHasExpiredOnRequest(options, handler);
    } else if (accessTokenHasExpired) {
      // regenerate access token
      // _dio.interceptors.requestLock.lock();
      refreshed = await _regenerateAccessToken();
      // _dio.interceptors.requestLock.unlock();
    }

    if (refreshed) {
      return _addNewHeaderAfterRefresh(options, accessToken, handler);
    } else {
      return _failedToRefreshTokens(options, handler);
    }
  }

  void _removeAuxiliaryRequierTokenHeader(
      RequestOptions options, RequestInterceptorHandler handler) {
    // if the request doesn't need token, then just continue to the next interceptor
    options.headers.remove("requiresToken"); //remove the auxiliary header
    return handler.next(options);
  }

  void _failedToRefreshTokens(
      RequestOptions options, RequestInterceptorHandler handler) {
    // create custom dio error
    options.extra["tokenErrorType"] =
        TokenErrorType.failedToRegenerateAccessToken;
    final error = DioError(requestOptions: options, type: DioErrorType.unknown);
    return handler.reject(error);
  }

  void _addNewHeaderAfterRefresh(RequestOptions options, String accessToken,
      RequestInterceptorHandler handler) {
    // add access token to the request header
    options.headers["Authorization"] = "Bearer $accessToken";
    return handler.next(options);
  }

  void _refreshTokenHasExpiredOnRequest(
      RequestOptions options, RequestInterceptorHandler handler) {
    _performLogout(_dio);

    // create custom dio error
    options.extra["tokenErrorType"] = TokenErrorType.refreshTokenHasExpired;
    final error = DioError(requestOptions: options, type: DioErrorType.unknown);

    return handler.reject(error);
  }

  void _allTokensNullOnRequest(
      RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: specify what to do with it
    // create custom dio error
    options.extra["tokenErrorType"] =
        TokenErrorType.failedToRegenerateAccessToken;
    final error = DioError(requestOptions: options, type: DioErrorType.unknown);

    return handler.reject(error);
  }

  void _performLogout(Dio dio) {
    // _dio.interceptors.requestLock.clear();
    // _dio.interceptors.requestLock.lock();

    _localStorage.removeTokens(); // remove token from local storage

    // back to login page without using context
    // check this https://stackoverflow.com/a/53397266/9101876
    // navigatorKey.currentState?.pushReplacementNamed(LoginPage.routeName);

    // _dio.interceptors.requestLock.unlock();
  }

  /// return true if it is successfully regenerate the access token
  Future<bool> _regenerateAccessToken() async {
    try {
      var dio =
          Dio(); // should create new dio instance because the request interceptor is being locked

      // get refresh token from local storage
      final refreshToken = _localStorage.refreshToken;

      // make request to server to get the new access token from server using refresh token
      final response = await dio.post(
        "https://yourDomain.com/api/refresh",
        options: Options(headers: {"Authorization": "Bearer $refreshToken"}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final newAccessToken = response
            .data["accessToken"]; // parse data based on your JSON structure
        _localStorage.accessToken = newAccessToken; // save to local storage
        return true;
      } else if (response.statusCode == 401 || response.statusCode == 403) {
        // it means your refresh token no longer valid now, it may be revoked by the backend
        _performLogout(_dio);
        return false;
      } else {
        print(response.statusCode);
        return false;
      }
    } on DioError {
      return false;
    } catch (e) {
      return false;
    }
  }
}
