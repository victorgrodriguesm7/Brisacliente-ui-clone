import 'package:Brisacliente/src/components/RoundedAppBar/RoundedAppBar.dart';
import 'package:Brisacliente/src/controllers/HomePageController.dart';
import 'package:flutter/material.dart';

class SupportTab extends StatefulWidget {
  final HomePageController controller;

  const SupportTab({Key key, this.controller}) : super(key: key);
  @override
  _SupportTabState createState() => _SupportTabState();
}

class _SupportTabState extends State<SupportTab> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFecf0f1),
      appBar: RoundedAppBar(title: "Suporte"),
      body: Padding(
        padding: EdgeInsets.only(
            top: height * 0.05,
            left: width * 0.1,
            right: width * 0.1
        ),
        child: Column(
          children: [
            Container(
              height: height * 0.14,
              decoration: BoxDecoration(
                color: Color(0xFF3796d8),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Você sabia?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Text(
                      "Você pode solicitar que alguém da nossa equipe entre em contato com você!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.025),
              child: Wrap(
                spacing: width * 0.1,
                runSpacing: height * 0.025,
                children: [
                  Container(
                    width: width * 0.35,
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.message,
                            color: Color(0xFFf46e27),
                            size: height * 0.045,
                          ),
                          Text(
                            "FAQ",
                            style: TextStyle(
                                color: Color(0xFF062a66),
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.35,
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.phone,  
                            color: Color(0xFFf46e27),
                            size: height * 0.045,
                          ),
                          Text(
                            "Ligamos para você",
                            style: TextStyle(
                                color: Color(0xFF062a66),
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}