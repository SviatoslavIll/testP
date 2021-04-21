import 'package:flutter_session/flutter_session.dart';

abstract class AuthService {
  static final session = FlutterSession();

  Future<dynamic> registration(String email, String password);

  Future<dynamic> login(String email, String password);

  static setToken(String token, String refreshToken) async {
    _AuthData data = _AuthData(token, refreshToken);
    await session.set('tokens', data);
  }

  static Future<Map<String, dynamic>> getToken() async {
    return await session.get('tokens');
  }

  static removeToken() async {
    await session.prefs.clear();
  }
}

class _AuthData {
  String token, refreshToken, clientId;

  _AuthData(this.token, this.refreshToken, {this.clientId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['token'] = token;
    data['refreshToken'] = refreshToken;
    data['clientId'] = clientId;
    return data;
  }
}
