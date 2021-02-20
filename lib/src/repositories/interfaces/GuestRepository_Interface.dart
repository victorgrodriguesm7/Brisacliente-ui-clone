import 'dart:io';
import 'package:Brisacliente/src/models/contract.dart';

abstract class IGuestRepository {
  Future<bool> isContractsNotAccepted(String cpf);
  Future<Uri> sendDocuments(List<File> images);
  Future<List<Contract>> getContracts();
  void acceptContract(int index);
}