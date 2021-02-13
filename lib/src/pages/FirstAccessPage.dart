import 'package:Brisacliente/src/components/LoginBox/LoginBox.dart';
import 'package:Brisacliente/src/controllers/FirstAccessController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class FirstAcessPage extends StatefulWidget {
  final controller = FirstAccessController();
  FirstAcessPage({Key key}) : super(key: key);

  @override
  _FirstAcessPageState createState() => _FirstAcessPageState();
}

class _FirstAcessPageState extends State<FirstAcessPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0)
          )
        ),
        backgroundColor: Color(0xFF093d93),
        title: Text(
          "Brisacliente", 
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w500
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFecf0f1),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height * 0.025),
            child: LoginBox(
              type: "column",
              children: [
                Padding(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: height * 0.025),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 0.2)
                              )
                          ),
                          child: SizedBox(
                            width: width * 0.9,
                            height: height * 0.08,
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black
                                ),
                                children: [
                                  TextSpan(
                                    text: "Vamos enviar para você um código para "
                                  ),
                                  TextSpan(
                                    text: "definir a sua nova senha.", 
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                  TextSpan(
                                    text: "Para isso vamos precisar "
                                  ),
                                  TextSpan(
                                    text: "confirmar alguns dados", 
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                  TextSpan(
                                    text: ":"
                                  )
                                ]
                              )
                            ),
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Observer(builder: (_) {
                          var controller = TextEditingController(text: this.widget.controller.client.cpf);
                          controller.selection = TextSelection.fromPosition(
                            TextPosition(offset: controller.text.length)
                          );
                          return TextFormField(
                            maxLength: 14,
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Digite o CPF/CNPJ",
                              hintText: "CPF ou CNPJ",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide(
                                    color: Color(0xFF093d93),
                                    width: 1.2
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide(
                                    color: Color(0xFF093d93),
                                    width: 1.8
                                  )
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide: BorderSide(
                                  color: Color(0xFFf20505),
                                  width: 1.8
                                )
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide: BorderSide(
                                  color: Color(0xFFf20505),
                                  width: 1.8
                                )
                              ),
                            ),
                            controller: controller,
                            onChanged: this.widget.controller.client.changeCpf,
                            validator: this.widget.controller.client.validateCpf,
                            onFieldSubmitted: (value){
                              if (_formKey.currentState.validate()){
                                this.widget.controller.changeLoading(true);
                              }
                            }
                          );
                        }),
                      ),
                      SizedBox(
                        height: height * 0.08,
                        child: Observer(
                          builder: (_) {
                            return Text(
                              this.widget.controller.loading ? "Nenhum telefone encontrado!" : "",
                              style: TextStyle(
                                color: Colors.redAccent
                              )
                            );
                          }
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}