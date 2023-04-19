import 'package:dio/dio.dart';
import 'package:internship_app/http_interaction/auth_interceptor.dart';
import 'package:internship_app/registration_store/registration_store.dart';

/// This class is used to send requests to the server
/// Use it like this:
/// final DioCustomClient dioCustomClient = DioCustomClient();
/// dioCustomClient.dio(do something with dio)
///
///
/// example of using when we need token(after otp)
// await dio.get("/user", data: myData);

/// example of using when we don't need token(before and including otp)
///  await dio.post(
/// "/login",
/// data: loginData,
/// options: Options(headers: {"requiresToken": false}), // add this line
// );
class DioCustomClient {
  final Dio dio = Dio();

  DioCustomClient() {
    dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
    dio.interceptors.add(AuthInterceptor(dio));
  }
}
