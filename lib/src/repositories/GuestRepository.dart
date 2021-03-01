import 'dart:io';

import 'package:Brisacliente/src/models/contract.dart';
import 'package:Brisacliente/src/repositories/interfaces/GuestRepository_Interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobx/mobx.dart';

class GuestRepository implements IGuestRepository{
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Contract> contracts = [];
  Map<String, dynamic> data;
  String id;

  @override
  void acceptContract(int index) {
    contracts[index].setIsAccepted(true);
  }

  @override
  Future<List<Contract>> getContracts() async {
    contracts = [];
    for (DocumentReference contractReference in data["contracts"]){
      var doc = await firestore.collection("Contracts").doc(contractReference.id).get();
      String title = doc.data()["title"];
      String type = doc.data()["type"];
      var contract = Contract(title, type);

      contracts.add(contract);
    }

    return contracts;
  }

  @override
  Future<bool> isContractsNotAccepted(String cpf) async {
    print("Contratos não aceitos");
    var docs = await firestore.collection("ContractsNotAccepted")
      .where("cpf",isEqualTo:  cpf).limit(1).get();
    if (docs.docs.isEmpty){
      return false;
    }

    var doc = docs.docs[0];
    data = doc.data();
    id = doc.id;

    return true;
  }

  @override
  Future<bool> sendDocuments(ObservableMap<String, File> images, String cpf) async {
    try {
      for (String name in images.keys) {
        UploadTask uploadTask;
        Reference ref = FirebaseStorage.instance
            .ref()
            .child('$cpf')
            .child('/$name.jpg');

        final metadata = SettableMetadata(
            contentType: 'image/jpeg',
        );

        uploadTask = ref.putFile(images[name], metadata);

        await uploadTask.whenComplete(() => null);
        print('$name enviado');
      }
    } catch (e) {
      return false;
    }
    
    return true;
  }
}