import 'package:Brisacliente/src/models/client.dart';
import 'package:mobx/mobx.dart';
part 'LoginPageController.g.dart';

class LoginPageController = _LoginPageControllerBase with _$LoginPageController;

abstract class _LoginPageControllerBase with Store {
  var client = Client();
  
}