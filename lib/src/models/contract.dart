import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'contract.g.dart';

class Contract extends _ContractBase with _$Contract {
  Contract(String title, String type){
    super.title = title;
    super.type = type;
  }
}

abstract class _ContractBase with Store {
  String title;
  String type;

  @observable
  bool isAccepted = false;

  @action
  setIsAccepted(bool value) => isAccepted = value;

  IconData typeToIcon() {
    switch (this.type){
      case "internet":
        return Icons.wifi;
      case "tv":
        return Icons.tv;
      case "phone":
        return Icons.call;
      default:
        return Icons.build;
    }    
  }
}