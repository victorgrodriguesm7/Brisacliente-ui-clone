import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<User> getUser();
  Future getEmailPasswordLogin(String email, String password);
  Future<String> getToken();
  Future getLogout();
}