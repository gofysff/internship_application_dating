import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageTokens {
  final storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  // our storage doesn't contain accessToken
  String? accessToken;

  void writeRefreshToken(String accessToken) async {
    await storage.write(key: 'refreshToken', value: accessToken);
  }

  Future<String?> get refreshToken => storage.read(key: 'refreshToken');

  void removeTokens() async {
    await storage.delete(key: 'refreshToken');
    accessToken = null;
  }
}
