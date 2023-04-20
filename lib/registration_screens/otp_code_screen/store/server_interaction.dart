import 'package:dio/dio.dart';
import 'package:internship_app/http_interaction/dio_custom_client.dart';

class ServerInteractionOtpCodeScreen {
  final Dio dio = DioCustomClient.singletonInstance.dio;

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
}
