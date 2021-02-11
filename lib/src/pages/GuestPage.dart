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
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Prosseguir",
                        style: TextStyle(
                          color: Color(0xFF093d93),
                          fontWeight: FontWeight.w400
                        ),
                      ), 
                      onPressed: (){
                        _formKey.currentState.validate();
                      }
                    ),
                  ),
                ),
                SizedBox(
                  width: width,
                  height: height * 0.06,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(
                        color: Color(0xFF5376ae),
                        width: 1
                      )
                    ),
                    color: Color(0xFF093d93),
                    child: Text(
                      "Voltar",
                      style: TextStyle(
                        color: Color(0xFF5376ae),
                        fontWeight: FontWeight.w400
                      ),
                    ),
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
