import 'package:Brisacliente/src/components/LoginBoxButton/LoginBoxButton.dart';
import 'package:Brisacliente/src/controllers/LoginPageController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginForm extends StatefulWidget {
  final LoginPageController controller;
  LoginForm({Key key, this.controller}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController cpfController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double sidePadding = width * 0.03;
    double topPadding = height * 0.03;
    return Padding(
      padding: EdgeInsets.only(
          left: sidePadding, right: sidePadding, top: topPadding),
      child: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Observer(
                builder: (_) {
                  return TextFormField(
                    decoration: InputDecoration(
                      labelText: "E-Mail",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide:
                              BorderSide(color: Color(0xFF093d93), width: 1.2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide:
                              BorderSide(color: Color(0xFF093d93), width: 1.8)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide:
                              BorderSide(color: Color(0xFFf20505), width: 1.8)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide:
                              BorderSide(color: Color(0xFFf20505), width: 1.8)),
                    ),
                    onChanged: this.widget.controller.client.changeEmail
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: topPadding),
                child: Observer(builder: (_) {
                  var controller = TextEditingController(
                      text: this.widget.controller.client.cpf);
                  controller.selection = TextSelection.fromPosition(
                      TextPosition(offset: controller.text.length));
                  return TextFormField(
                    decoration: InputDecoration(
                      labelText: "CPF",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide:
                              BorderSide(color: Color(0xFF093d93), width: 1.2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide:
                              BorderSide(color: Color(0xFF093d93), width: 1.8)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide:
                              BorderSide(color: Color(0xFFf20505), width: 1.8)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide:
                              BorderSide(color: Color(0xFFf20505), width: 1.8)),
                    ),
                    controller: controller,
                    validator: this.widget.controller.client.validateCpf,
                    onChanged: this.widget.controller.client.changeCpf,
                    maxLength: 14,
                    buildCounter: (BuildContext context,
                            {int currentLength,
                            int maxLength,
                            bool isFocused}) =>
                        null,
                    keyboardType: TextInputType.phone,
                  );
                }),
              ),
              Observer(
                builder: (_){
                return Padding(
                    padding: EdgeInsets.only(top: topPadding, bottom: topPadding),
                    child: LoginBoxButton(
                      width: width,
                      text: "Entrar",
                      onPressed: () {
                        if (_formKey.currentState.validate()){
                          this.widget.controller.login(
                            this.widget.controller.client.email,
                            this.widget.controller.client.cpf
                          );
                        }
                      },
                      isEnabled: !this.widget.controller.loading,
                    ),
                  );
                },
              ),
              Observer(
                builder: (_){
                  return SizedBox(
                    height: this.widget.controller.error.length > 0 ? height * 0.05 : 0,
                    child: Text(
                      this.widget.controller.error,
                      style: TextStyle(
                        color: Colors.red
                        ),
                      )
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
