import 'package:Brisacliente/src/components/GuestButton/GuestButton.dart';
import 'package:Brisacliente/src/components/WarningDialog/WarningDialog.dart';
import 'package:Brisacliente/src/controllers/GuestPageController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class GuestPage extends StatefulWidget {
  GuestPage({Key key}) : super(key: key);

  @override
  _GuestPageState createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
  final _formKey = GlobalKey<FormState>();
  final GuestPageController controller = GuestPageController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double bottomPadding = height * 0.02;
    return Scaffold(
      backgroundColor: Color(0xFF093d93),
      body: Padding(
        padding: EdgeInsets.only(
            top: height * 0.15,
            left: width * 0.1,
            right: width * 0.08,
            bottom: height * 0.02
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    height: height * 0.2,
                    child: Text(
                      "Brisacliente",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                      ),
                    )
                ),
              ],
            ),
            Column(
              children: [
                Observer(builder: (context){
                  return controller.loading ? 
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.15),
                    child: SizedBox(
                      width: 100,
                      height: 80,
                      child: CircularProgressIndicator()
                    ),
                  ) : 
                  SizedBox(
                    width: 100,
                    height: 80,
                  );
                }),
                Row(
                  children: [
                    Text("Olá, Digite seu documento",
                        style: TextStyle(color: Colors.white, fontSize: 24)),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: bottomPadding),
                  child: Form(
                    key: _formKey,
                    child: Observer(builder: (_) {
                      var controller = TextEditingController(text: this.controller.client.cpf);
                      controller.selection = TextSelection.fromPosition(
                          TextPosition(offset: controller.text.length)
                      );
                      return TextFormField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 30, color: Colors.white),
                            decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.white))),
                            buildCounter: (BuildContext context,{int currentLength,int maxLength,bool isFocused}) => null,
                            maxLength: 14,
                            controller: controller,
                            validator: this.controller.client.validateCpf,
                            onChanged: this.controller.client.changeCpf,
                        );
                      }
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: bottomPadding),
                  child: SizedBox(
                    width: width,
                    height: height * 0.06,
                    child: GuestButton(
                      text: "Prosseguir",
                      isInverted: false,
                      onPressed:  () async {
                        if(_formKey.currentState.validate()){
                          if (await controller.isContractNotAccepted()){
                            Navigator.pushNamed(
                              context,
                              "/contract",
                              arguments: controller
                            );
                          }else{
                            Widget dialog = WarningDialog(
                              error: controller.error,
                              redirectText: "Ir para o Login",
                              redirectFunction: () => Navigator.pushReplacementNamed(context, "/"),
                            );

                            showDialog(
                              context: context,
                              builder: (context) => dialog
                            );
                          }
                        }  
                      },
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
