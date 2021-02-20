import 'package:Brisacliente/src/components/ContractWidget/ContractWidget.dart';
import 'package:Brisacliente/src/components/GuestButton/GuestButton.dart';
import 'package:Brisacliente/src/components/RoundedAppBar/RoundedAppBar.dart';
import 'package:Brisacliente/src/controllers/GuestPageController.dart';
import 'package:Brisacliente/src/models/contract.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AcceptContractPage extends StatefulWidget {
  AcceptContractPage({Key key}) : super(key: key);

  @override
  _AcceptContractPageState createState() => _AcceptContractPageState();
}

class _AcceptContractPageState extends State<AcceptContractPage> {
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
            top: height * 0.02,
            left: width * 0.1,
            right: width * 0.08,
            bottom: height * 0.01
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: width,
                child: Text(
                  "Agora falta pouco",
                  style: TextStyle(
                    color: Color(0xFF093d93),
                    fontSize: 28
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: SizedBox( 
                  width: width,
                  child: Text(
                    "Confime seus contratos e depois toque em finalizar!",
                    style: TextStyle(
                      color: Color(0xFF093d93),
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    )
                  )
                ),
              ),
              FutureBuilder(
                future: controller.getContracts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done){
                    List<Widget> contractsWidgets = [];
                    for (Contract contract in controller.contracts){
                      contractsWidgets.add(
                        ContractWidget(
                          contract: contract
                        )
                      );
                    }
                    return Column( children: contractsWidgets);
                  } else {
                    return CircularProgressIndicator();
                  }
                }
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Observer(builder: (_) {
                      bool isContractsAccepted = true;
                      for (Contract contract in controller.contracts) {
                        isContractsAccepted &= contract.isAccepted;
                      }
                      return isContractsAccepted ? Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: SizedBox(
                          width: width,
                          height: height * 0.06,
                          child: GuestButton(
                            notInvertedBackgroundColor: Color(0xFF093d93),
                            notInvertedTextColor: Colors.white,
                            text: "Finalizar",
                            onPressed: () => {
                              
                            },
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}