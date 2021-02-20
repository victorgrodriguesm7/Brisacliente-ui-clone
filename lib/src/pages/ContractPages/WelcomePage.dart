import 'package:Brisacliente/src/components/GuestButton/GuestButton.dart';
import 'package:Brisacliente/src/controllers/GuestPageController.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GuestPageController controller = ModalRoute.of(context).settings.arguments;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF093d93),
      body: Padding(
        padding: EdgeInsets.only(
            top: height * 0.15,
            left: width * 0.1,
            right: width * 0.08,
            bottom: height * 0.06
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: height * 0.08,
              child: Text(
                "Brisacliente", 
                style: TextStyle(
                  fontSize: 42,
                  color: Colors.white,
                  fontWeight: FontWeight.w500)
                )
            ),
            Column(
              children: [
                Text(
                  "Olá, que bom ter você por aqui!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w500
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Para que possamos prosseguir com seu cadastro, precisaremos passar por alguns procedimentos, como a assinatura dos contratos e o envio das fotos para comprovar sua identidade!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300
                    )
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: SizedBox(
                    width: width,
                    height: height * 0.06,
                    child: GuestButton(
                      text: "Ativar agora",
                      isInverted: false,
                      onPressed: () => Navigator.pushNamed(
                        context, 
                        "/contract/documents",
                        arguments: controller
                      )
                    ),
                  ),
                ),
                SizedBox(
                  width: width,
                  height: height * 0.06,
                  child: GuestButton(
                    text: "Voltar",
                    isInverted: true,
                    onPressed: () => Navigator.pop(context)
                  ),
                ),
              ],
            )
          ]
        )  
      )
    );
  }
}