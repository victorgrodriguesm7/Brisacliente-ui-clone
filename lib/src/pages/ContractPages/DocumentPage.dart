import 'package:Brisacliente/src/components/GuestButton/GuestButton.dart';
import 'package:Brisacliente/src/components/RoundedAppBar/RoundedAppBar.dart';
import 'package:Brisacliente/src/controllers/GuestPageController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DocumentPage extends StatefulWidget {
  DocumentPage({Key key}) : super(key: key);

  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
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
                      TextSpan(text: "Precisamos de "),
                      TextSpan(text: "fotos do documento.", style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: "Lembre-se, "),
                      TextSpan(text: "fotos nítidas ", style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: "para verificar sua identidade.")
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
                        TextSpan(text: "Aceitamos apenas "),
                        TextSpan(text: "RG ou CNH.", style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: "Comece pela "),
                        TextSpan(text: "frente ", style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: "do documento com foto.")
                      ]
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.1, bottom: height * 0.10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Observer(builder: (_) {
                    var havePicture = controller.haveImage("Frente");

                    return FlatButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => controller.getImage("Frente"),
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
                                  Icons.photo_camera,
                                  color: havePicture ? Colors.white : Color(0xFF093d93),
                                  size: height * 0.08,
                                ),
                                Text(
                                  "Frente",
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
                  Observer(builder: (_) {
                    var havePicture = controller.haveImage("Verso");

                    return FlatButton(
                        padding: EdgeInsets.zero,                 
                        onPressed: () => controller.getImage("Verso"),
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
                                  Icons.photo_camera,
                                  color: havePicture ? Colors.white : Color(0xFF093d93),
                                  size: height * 0.08,
                                ),
                                Text(
                                  "Verso",
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
                  })
                ],
              ),
            ),
            Column(
              children: [
                Observer(builder: (_) {
                  bool hasPictures = (controller.haveImage("Frente") && controller.haveImage("Verso"));
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
                          "/contract/selfie",
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