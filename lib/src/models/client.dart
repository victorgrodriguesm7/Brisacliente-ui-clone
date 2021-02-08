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
    if (cpf != null){
      if (cpf.length == 2 && value.length == 3 ||
          cpf.length == 6 && value.length == 7){
        cpf = value + ".";
      }else if (cpf.length == 10 && value.length == 11){
        cpf = value + "-";
      }else {
        cpf = value;
      }
    }else {
      cpf = value;
    }
  }
}