import 'package:Brisacliente/src/components/GuestButton/GuestButton.dart';
import 'package:Brisacliente/src/components/RoundedAppBar/RoundedAppBar.dart';
import 'package:Brisacliente/src/controllers/GuestPageController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SelfiePage extends StatefulWidget {
  SelfiePage({Key key}) : super(key: key);

  @override
  _SelfiePageState createState() => _SelfiePageState();
}

class _SelfiePageState extends State<SelfiePage> {
  @override
  Widget build(BuildContext context) {
    final GuestPageController controller = ModalRoute.of(context).settings.arguments;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: RoundedAppBar(),
      backgroundColor: Color(0xFFecf0f1),
      body: Padding(
        padding: EdgeInsets.only(
            top: height * 0.05,
            left: width * 0.1,
            right: width * 0.08,
            bottom: height * 0.02
        ),
        child: Column(
          children: [
            Column(
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Color(0xFF093d93),
                      fontSize: 24
                    ),
                    children: [
                      TextSpan(text: "Agora precisamos de uma "),
                      TextSpan(text: "foto sua segurando o documento.", style: TextStyle(fontWeight: FontWeight.bold))
                    ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Color(0xFF093d93),
                        fontSize: 16
                      ),
                      children: [
                        TextSpan(text: "Não tire foto de outra foto ", style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: "e tenha cuidado para "),
                        TextSpan(text: "não cobrir seu rosto ", style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: "com o documento."),
                        TextSpan(text: "Não se preocupe, "),
                        TextSpan(text: "esta foto não será divulgada ", style: TextStyle(fontWeight: FontWeight.bold)),
                      ]
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.1, bottom: height * 0.10),
              child: Observer(builder: (_) {
                var havePicture = controller.haveImage("Selfie");
                return FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => controller.getImage("Selfie"),
                    splashColor: Colors.transparent,  
                    highlightColor: Colors.transparent,
                    child: Column(
                      children: [
                        Container(
                        height: height * 0.15,
                        width: width * 0.35,
                        decoration: BoxDecoration(
                          color: havePicture ? Color(0xFFf46e27) : Colors.white,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_front,
                              color: havePicture ? Colors.white : Color(0xFF093d93),
                              size: height * 0.08,
                            ),
                            Text(
                              "Selfie",
                              style: TextStyle(
                                fontSize: 18, 
                                color: havePicture ? Colors.white : Color(0xFF093d93),
                                fontWeight: FontWeight.w300
                              )
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Icon(
                          Icons.check, 
                          color: havePicture ?  Colors.green : Colors.transparent,
                          size: height * 0.05
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
            Column(
              children: [
                Observer(builder: (_) {
                  bool hasPictures = controller.haveImage("Selfie");
                  return hasPictures ? Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      width: width,
                      height: height * 0.06,
                      child: GuestButton(
                        notInvertedBackgroundColor: Color(0xFF093d93),
                        notInvertedTextColor: Colors.white,
                        text: "Próximo",
                        onPressed: () => Navigator.pushNamed(
                          context, 
                          "/contract/accept",
                          arguments: controller
                        ),
                      ),
                    ),
                  ) : Container();
                }),
                SizedBox(
                  width: width,
                  height: height * 0.06,
                  child: GuestButton(
                    text: "Voltar",
                    isInverted: true,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            )
          ],
        )
      )
    );
  }
}