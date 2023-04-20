import 'package:dio/dio.dart';
import 'package:internship_app/http_interaction/dio_custom_client.dart';

class ServerInteractionPhoneNumberScreen {
  final Dio dio = DioCustomClient.singletonInstance.dio;

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
}
