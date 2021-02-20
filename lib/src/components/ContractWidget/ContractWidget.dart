import 'package:Brisacliente/src/models/contract.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContractWidget extends StatefulWidget {
  final Contract contract;
  ContractWidget({Key key, this.contract}) : super(key: key);

  @override
  _ContractWidgetState createState() => _ContractWidgetState();
}

class _ContractWidgetState extends State<ContractWidget> {
  @override
  Widget build(BuildContext context) {
    String title = this.widget.contract.title;
    IconData type = this.widget.contract.typeToIcon();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Observer( builder: (_){
        bool isAccepted = this.widget.contract.isAccepted;
        return SizedBox(
          height: height * 0.255,
          width: width,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5)
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Color(0xFF093d93),
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      Icon(type, color: Color(0xFFf46e27))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10
                    ),
                    child: Text(
                      !isAccepted ? "Contrato ainda não assinado, você pode visualizá-lo e em seguida realizar a assinatura." :
                      "Você assinou o contrato e pode visualizá-lo a qualquer momento",
                      style: TextStyle(
                        color: Colors.black45
                      )
                    ),
                  ),
                  SizedBox(
                    width: width,
                    child: Text(
                      "Situação",
                      style: TextStyle(
                        color: Colors.black45
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    width: width,
                    child: Text(
                      isAccepted ? "Contrato confirmado" : "Contrato não confirmado",
                      style: TextStyle(
                        color: isAccepted ? Colors.green : Colors.orange[800],
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: height * 0.05,
                          width: width * 0.35,
                          child: FlatButton(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)
                            ),
                            color: Color(0xFFf46e27),
                            child: Text(
                              "Visualizar", 
                              style: TextStyle(
                                color: Colors.white
                              )
                            ),
                            onPressed: () => {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6)
                        ),
                        isAccepted ? Container() : SizedBox(
                          height: (height * 0.05) - 1,
                          width: width * 0.35,
                          child: FlatButton(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFF093d93)),
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Text(
                              "Confirmar", 
                              style: TextStyle(
                                color: Color(0xFF093d93)
                              )
                            ),
                            onPressed: () => this.widget.contract.setIsAccepted(true),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
        );
      })
    );
  }
}