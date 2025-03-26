import 'package:know_go/imports/app_imports.dart';

abstract interface class SessionManager {
  Future<void> setToken(String token);

  Future<String> getToken();

  Future<void> clearSession();
}

class SessionManagerImp implements SessionManager {
  final SharedPreferences sharedPreferences;
  SessionManagerImp({required this.sharedPreferences});

  @override
  Future<String> getToken() async {
    return sharedPreferences.getString(Keys.TOKEN.toString()) ?? '';
  }

  @override
  Future<void> setToken(String token) async {
    sharedPreferences.setString(Keys.TOKEN.toString(), token);
  }

  @override
  Future<void> clearSession() async {
    sharedPreferences.remove(Keys.TOKEN.toString());
  }
}

enum Keys { TOKEN }
