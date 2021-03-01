import 'dart:io';
import 'package:Brisacliente/src/models/contract.dart';
import 'package:mobx/mobx.dart';

abstract class IGuestRepository {
  Future<bool> isContractsNotAccepted(String cpf);
  Future sendDocuments(ObservableMap<String, File> images, String cpf);
  Future<List<Contract>> getContracts();
  void acceptContract(int index);
}