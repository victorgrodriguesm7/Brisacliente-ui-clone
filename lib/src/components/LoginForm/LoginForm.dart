import 'package:Brisacliente/src/components/LoginBoxButton/LoginBoxButton.dart';
import 'package:Brisacliente/src/models/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginForm extends StatefulWidget {
  final Client client;
  LoginForm({Key key, this.client}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
          child: Column(
            children: [
              Observer(
                builder: (_) {
                  return TextFormField(
                    decoration: InputDecoration(
                      labelText: "E-Mail",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13)),
                    ),
                    onChanged: this.widget.client.changeEmail,
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: topPadding),
                child: Observer(builder: (_) {
                  return TextFormField(
                    decoration: InputDecoration(
                      labelText: "CPF",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13)),
                    ),
                    onChanged: this.widget.client.changeCpf
                  );
                }),
              ),
              Padding(
                padding: EdgeInsets.only(top: topPadding),
                child: LoginBoxButton(
                  width: width,
                  text: "Entrar",
                  onPressed: () => {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
