import 'package:Brisacliente/src/components/LoginBox/LoginBox.dart';
import 'package:Brisacliente/src/components/LoginBoxButton/LoginBoxButton.dart';
import 'package:Brisacliente/src/components/LoginBoxText/LoginBoxText.dart';
import 'package:Brisacliente/src/components/LoginBoxTitle/LoginBoxTitle.dart';
import 'package:Brisacliente/src/controllers/LoginPageController.dart';
import 'package:Brisacliente/src/pages/GuestPage.dart';
import 'package:flutter/material.dart';
import '../components/LoginForm/LoginForm.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginPageController controller = LoginPageController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              color: Color(0xFF093d93),
              height: height * 0.33,
              width: width,
            ),
          ),
          Positioned(
            top: 100,
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.08,
                    child: Text(
                      "Brisacliente", 
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)
                      )
                  ),
                  LoginBox(
                    type: "column",
                    children: [
                      LoginForm(
                        client: this.controller.client,
                        cpfValidator: this.controller.client.validateCpf
                      )
                    ],
                  ),
                  LoginBox(
                    height: height * 0.125,
                    radius: 13,
                    children: [
                      SizedBox(
                        width: width / 1.7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LoginBoxTitle(text: "ACESSO COMO VISITANTE"),
                            LoginBoxText(text: "Assine seus contratos, envie suas fotos e acompanhe sua instação!")
                          ],
                        ),
                      ),
                      LoginBoxButton(
                        text: "ACESSAR",
                        onPressed: (){
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GuestPage()
                            ),
                          );
                        }
                      )
                    ],
                  ),
                  LoginBox(
                    height: height * 0.125,
                    radius: 13,
                    children: [
                      SizedBox(
                        width: width / 1.7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LoginBoxTitle(text: "PRIMEIRO ACESSO / RECUPERAR SENHA"),
                            LoginBoxText(text: "Primeira vez por aqui? Ou esqueceu a senha?"),
                          ],
                        ),
                      ),
                      LoginBoxButton(
                        text: "ACESSAR",
                        isInverted: true,
                        onPressed: () => {}
                      )
                    ],
                  ),
                ],
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
        ),
      ]
    );
  }
}
