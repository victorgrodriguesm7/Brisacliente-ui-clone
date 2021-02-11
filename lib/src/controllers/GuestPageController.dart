import 'package:Brisacliente/src/models/client.dart';
import 'package:mobx/mobx.dart';
part 'GuestPageController.g.dart';

class GuestPageController = _GuestPageControllerBase with _$GuestPageController;

abstract class _GuestPageControllerBase with Store {
  var client = Client();
}