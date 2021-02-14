import 'package:Brisacliente/src/auth/auth_controller.dart';
import 'package:Brisacliente/src/models/client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'LoginPageController.g.dart';

class LoginPageController = _LoginPageControllerBase with _$LoginPageController;

abstract class _LoginPageControllerBase with Store {
  var client = Client();
  var authController = AuthController();

  @observable
  bool loading = false;

  @observable
  String error = "";

  @action
  setError(String value) => error = value;

  @action
  Future login(email, password) async {
    try {
      loading = true;
      await authController.loginWithEmailandPassword(email, password);
    } on FirebaseAuthException catch(e) {
      print(e.code);
      if (e.code == "user-not-found"){
        setError("Email não encontrado");
        print("Email não encontrado");
      } 
      if (e.code == "wrong-password"){
        setError("CPF inválido para esse email");
        print("CPF inválido para esse email");
      }
      loading = false;
    }
  }
}