import 'package:dio/dio.dart';
import 'package:internship_app/http_interaction/auth_interceptor.dart';

/// This class is used to send requests to the server
/// It is a singleton
/// It is used to send requests to the server
/// for gettigng singletone instance use [DioCustomClient.singletonInstance]
/// Use it like this:
/// ```dart
/// final DioCustomClient dioCustomClient = DioCustomClient();
/// dioCustomClient.dio(do_something_with_dio)
///```
///
/// example of using when we need token(after otp)
/// ```dart
/// await dio.get("/user", data: myData);
/// ```
///
///
/// example of using when we don't need token(before and including otp)
/// ```dart
///  await dio.post(
/// "/login",
/// data: loginData,
/// options: Options(headers: {"requiresToken": false}),
/// );
/// ```
// @pragma("wasm:entry-point")
class DioCustomClient {
  DioCustomClient._privateConstructor();
  static final DioCustomClient singletonInstance =
      DioCustomClient._privateConstructor();

  final _dio = Dio();

  DioCustomClient() {
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
    _dio.interceptors.add(AuthInterceptor(_dio));
  }

  // return closed instance of dio
  Dio get dio => _dio;
}
