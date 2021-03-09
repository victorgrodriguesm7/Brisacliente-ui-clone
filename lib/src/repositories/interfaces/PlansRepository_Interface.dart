import 'package:Brisacliente/src/models/plan.dart';

abstract class IPlansRepository {
  Future<String> getAddress();
  Future<List<Plan>> getPlans();
}
