import './auth_repository_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository implements IAuthRepository{
  final FirebaseAuth auth = FirebaseAuth.instance;
  
  @override
  Future getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future getEmailPasswordLogin() {
    // TODO: implement getEmailPasswordLogin
    throw UnimplementedError();
  }

  @override
  Future<String> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }
}