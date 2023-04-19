import 'package:dio/dio.dart';
import 'package:internship_app/registration_store/to_json_interface.dart';

import 'dio_custom_client.dart';

class InteractionWithServer {
  final Dio dio = DioCustomClient().dio;
  Future<Response> sendPhoneNumber(String phoneNumber) async {
    final data = {"phone": phoneNumber};
    return await dio.post(
      "/phone_number", // TODO: change this url
      data: data,
      options: Options(
        headers: {"requiresToken": false},
      ),
    );
  }

  Future<Response> sendOtp(String otp) async {
    final data = {"otp": otp};
    return await dio.post(
      "/otp", // TODO: change this url
      data: data,
      options: Options(
        headers: {"requiresToken": false},
      ),
    );
  }

  Future<Response> sendAllInfoAboutUser(ToJsonInterface store) {
    return dio.post(
      "/all_register_info", // TODO: change this url
      data: store.toJson(),
    );
  }
}
