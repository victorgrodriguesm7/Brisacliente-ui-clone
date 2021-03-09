import 'package:Brisacliente/src/models/plan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'interfaces/PlansRepository_Interface.dart';

class PlansRepository implements IPlansRepository {
  final String uid;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  PlansRepository(this.uid);

  @override
  Future<String> getAddress() async {
    var doc = await firestore.collection("Users").doc(uid).get();

    return doc.data()["address"];
  }

  @override
  Future<List<Plan>> getPlans() async {
    List<Plan> plans = [];

    var doc = await firestore.collection("Users").doc(uid).get();
    var data = doc.data();
    for (DocumentReference contractReference in data["contracts"]) {
      var doc = await firestore
          .collection("Contracts")
          .doc(contractReference.id)
          .get();
      var contractData = doc.data();
      
      List<Map<String, dynamic>> options =
          List<Map<String, dynamic>>.from(contractData["options"]);
      String type = contractData["type"];
      String title = contractData["title"];

      plans.add(Plan(title, type, options));
    }

    return plans;
  }
}
