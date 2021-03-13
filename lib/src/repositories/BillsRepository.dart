import 'package:Brisacliente/src/repositories/interfaces/BillsRepository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BillsRepository implements IBillsRepository {
  final String uid;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  BillsRepository(this.uid);

  @override
  Future<List<Map<String, dynamic>>> getCalendarBills() async {
    var doc = await firestore.collection("Users").doc(uid).get();
    List<Map<String, dynamic>> bills = List<Map<String, dynamic>>.from(doc.data()["bills"]);

    return [
      {"expiry": "10/02/2021", "hasPaid": true, "paidAt": "08/02/2021"},
      {"expiry": "10/03/2021", "hasPaid": true, "paidAt": "08/03/2021"},
      {"expiry": "10/04/2021","hasPaid": false,}
    ];
  }
}
