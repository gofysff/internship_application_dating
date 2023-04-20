import 'package:dio/dio.dart';
import 'package:internship_app/http_interaction/dio_custom_client.dart';
import 'package:internship_app/registration_store/to_json_interface.dart';

class ServerInteractionShowUScreen {
  final Dio dio = DioCustomClient.singletonInstance.dio;

  Future<Response> sendAllInfoAboutUser(ToJsonInterface store) {
    return dio.post(
      "/all_register_info", // TODO: change this url
      data: store.toJson(),
    );
  }
}
