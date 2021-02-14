import 'package:Brisacliente/src/auth/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  var _authRepository = AuthRepository();

  @observable
  User user;

  @action
  setUser(User value) => user = value;

  _AuthControllerBase(){
    _authRepository.getUser().then(setUser);
  }
  
  Future loginWithEmailandPassword(email, password) async {
    user = await _authRepository.getEmailPasswordLogin(email, password);
  }

  Future logout() async {
    return _authRepository.getLogout();
  }
}