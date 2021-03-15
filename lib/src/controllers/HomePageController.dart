import 'package:Brisacliente/src/auth/auth_controller.dart';
import 'package:Brisacliente/src/repositories/PlansRepository.dart';
import 'package:Brisacliente/src/models/plan.dart';
import 'package:mobx/mobx.dart';
part 'HomePageController.g.dart';

class HomePageController extends _HomePageControllerBase
    with _$HomePageController {
  HomePageController(AuthController authController) {
    super._authController = authController;
    super._plansRepository = PlansRepository(_authController.user.uid);
    super.uid = _authController.user.uid;
    super.getAddress();
    super.getPlans();
  }
}

abstract class _HomePageControllerBase with Store {
  AuthController _authController;
  PlansRepository _plansRepository;
  String uid;
  @observable
  int index = 0;

  @action
  setIndex(int value) => index = value;

  getUserName() => _authController.user.displayName;

  @observable
  String address;

  @action
  Future<void> getAddress() async =>
      address = await _plansRepository.getAddress();

  @observable
  List<Plan> plans;

  @action
  Future<List<Plan>> getPlans() async =>
      plans = await _plansRepository.getPlans();

  getCpf() => _authController.getCpf();

  logout() async => await _authController.logout();
}
