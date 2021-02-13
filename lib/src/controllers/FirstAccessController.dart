import 'package:Brisacliente/src/models/client.dart';
import 'package:mobx/mobx.dart';
part 'FirstAccessController.g.dart';

class FirstAccessController = _FirstAccessControllerBase with _$FirstAccessController;

abstract class _FirstAccessControllerBase with Store {
  var client = Client();

  @observable
  bool loading = false;

  @action
  changeLoading(bool value) => loading = value;
}