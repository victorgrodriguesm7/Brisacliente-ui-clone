import 'package:Brisacliente/src/pages/ContractPages/AcceptContractPage.dart';
import 'package:Brisacliente/src/pages/ContractPages/WelcomePage.dart';
import 'package:Brisacliente/src/pages/ContractPages/DocumentPage.dart';
import 'package:Brisacliente/src/pages/ContractPages/SelfiePage.dart';
import 'package:Brisacliente/src/pages/FirstAccessPage.dart';
import 'package:Brisacliente/src/pages/GuestPage.dart';
import 'package:Brisacliente/src/pages/LoginPage.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  Widget initPage(BuildContext context, widget){
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: widget
      );
    }

    return MaterialApp(
      title: 'Brisacliente',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        "/" : (context) => initPage(context, LoginPage()),
        "/guestpage": (context) =>  initPage(context,GuestPage()),
        "/contract": (context) => initPage(context, WelcomePage()),
        "/contract/documents": (context) => initPage(context, DocumentPage()),
        "/contract/selfie": (context) => initPage(context, SelfiePage()),
        "/contract/accept": (context) => initPage(context, AcceptContractPage()),
        "/firstaccess" : (context) =>  initPage(context, FirstAcessPage())
      }
    );
  }
}