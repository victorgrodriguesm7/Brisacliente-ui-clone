import 'package:Brisacliente/src/components/FastAccessOptions/FastAccessOptions.dart';
import 'package:Brisacliente/src/components/SupportOptions/SupportOptions.dart';
import 'package:Brisacliente/src/controllers/HomePageController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartTab extends StatefulWidget {
  final HomePageController controller;

  const StartTab({Key key, this.controller}) : super(key: key);
  @override
  _StartTabState createState() => _StartTabState();
}

class _StartTabState extends State<StartTab> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        top: height * 0.05,
        left: width * 0.1,
        right: width * 0.1
      ),
      child: SizedBox(
        height: height * 0.85,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/logo.svg",
                    height: height * 0.05,
                    color: Color(0xFFf46e27)
                  ),
                  Icon(
                    Icons.notifications,
                    color: Color(0xFF093d93),
                    size: height * 0.05
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.025),
                child: Text(
                  "Olá, ${this.widget.controller.getUserName()}!",
                  style: TextStyle(
                    color: Color(0xFF062a66), 
                    fontSize: 30,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Text(
                "Como podemos lhe ajudar?",
                style: TextStyle(
                  color: Color(0xFF062a66), 
                  fontSize: 18,
                  fontWeight: FontWeight.w400
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.03),
                child: Text(
                  "Acesso rápido",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF062a66),
                    fontWeight: FontWeight.w600
                  )
                ),
              ),
              FastAccessOptions(
                uid: this.widget.controller.uid
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Precisa de suporte?",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF062a66),
                    fontWeight: FontWeight.w600
                  )
                ),
              ),
              SupportOptions()
            ]
          ),
        ),
      )
    );
  }
}
