import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'client.g.dart';

class Client = _ClientBase with _$Client;

abstract class _ClientBase with Store {
  @observable
  String email;
  @action
  changeEmail(String value) => email = value;

  @observable
  String cpf;
  @action
  changeCpf(String value){
    this.cpf = addMask(value);
  }

  String addMask(String cpf){
    var cpfWithMask = "";
    RegExp exp = new RegExp(r"\d");
    List<String> digits = exp.allMatches(cpf)
      .map((m) => 
          m.group(0)
      ).toList();
    
    for (var i = 0;i < digits.length; i++){
      if (i == 2 && this.cpf.length <= cpf.length || i == 5 && this.cpf.length <= cpf.length){
        cpfWithMask += digits[i] + ".";
      }else if (i == 8 && this.cpf.length <= cpf.length){
        cpfWithMask += digits[i] + "-";
      }else {
        cpfWithMask += digits[i];
      }
    }
    
    return cpfWithMask;
  }
}