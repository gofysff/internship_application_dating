import 'package:dio/dio.dart';
import 'package:internship_app/http_interaction/auth_interceptor.dart';
import 'package:internship_app/registration_store/registration_store.dart';

class HttpInteraction {
  final Dio dio = Dio();

  HttpInteraction() {
    dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
    dio.interceptors.add(AuthInterceptor(dio));
  }

  // example of using when we don't need token(before and including otp)
//   await dio.post(
//   "/login",
//   data: loginData,
//   options: Options(headers: {"requiresToken": false}), // add this line
// );

// example of using when we need token(after otp)
// await dio.get("/user", data: myData);

  Future<Response> sendPhoneNumber(String phoneNumber) async {
    final data = {"phone": phoneNumber};
    return await dio.post(
      "/login", // TODO: change this url
      data: data,
      options: Options(
        headers: {"requiresToken": false},
      ),
    );
  }

  Future<Response> sendOtp(String otp) async {
    final data = {"otp": otp};
    return await dio.post(
      "/login", // TODO: change this url
      data: data,
      options: Options(
        headers: {"requiresToken": false},
      ),
    );
  }

  Future<Response> sendAllInfoAboutUser(RegistrationStore store) {
    return dio.post(
      "/user", // TODO: change this url
      data: store.toJson(),
    );
  }
}
