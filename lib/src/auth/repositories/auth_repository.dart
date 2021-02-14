import './auth_repository_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository implements IAuthRepository{
  final FirebaseAuth auth = FirebaseAuth.instance;
  
  @override
  Future<User> getUser() async {
    return await auth.currentUser;
  }

  @override
  Future<User> getEmailPasswordLogin(String email, String password) async {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email, 
      password: password
    );

    final User user = userCredential.user;

    return user;
  }

  @override
  Future<String> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future getLogout() async {
    await auth.signOut();
  }
}