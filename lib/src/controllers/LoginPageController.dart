import 'package:Brisacliente/src/models/client.dart';
import 'package:mobx/mobx.dart';
part 'LoginPageController.g.dart';

class LoginPageController = _LoginPageControllerBase with _$LoginPageController;

abstract class _LoginPageControllerBase with Store {
  var client = Client();
  
  String validateCpf(String cpf){
    if (cpf.isEmpty)
      return 'Campo Obrigatório';
    if (cpf.length != 14){
      return "CPF inválido";
    }
    List<String> nonPossibleCpfs = [
      '000.000.000-00',
      '111.111.111-11',
      '222.222.222-22',
      '333.333.333-33',
      '444.444.444-44',
      '555.555.555-55',
      '666.666.666-66',
      '777.777.777-77',
      '888.888.888-88',
      '999.999.999-99'
    ];
    if(nonPossibleCpfs.indexOf(cpf) != -1){
      return "CPF inválido";
    }
    RegExp exp = new RegExp(r"\d");
    List<int> digits = exp.allMatches(cpf)
      .map((m) => 
          int.parse(m.group(0))
      ).toList();
    int sum = 0;
    
    for (var i = 0; i <= 8;i++){
      sum += digits[i] * (10 - i);
    }
    
    int firstDigit = sum * 10 % 11;
    if (firstDigit == 10 || firstDigit == 11){
      if (!(0 == digits[9])){
        return "CPF inválido";
      }
    }else {
      if (!(firstDigit == digits[9])){
        return "CPF inválido";
      }  
    }
    
    sum = 0;
    for (var i = 0; i <= 9; i++){
      sum += digits[i] * (11 - i);
    }
    int secondDigit = sum * 10 % 11;
    if (secondDigit == 10 || secondDigit == 11){
      if (!(0 == digits[10])){
        return "CPF inválido";
      }
    }else {
      if (!(secondDigit == digits[10])){
        return "CPF inválido";
      }  
    }
    return null;
  }
}