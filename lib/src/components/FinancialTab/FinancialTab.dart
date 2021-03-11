import 'package:Brisacliente/src/components/RoundedAppBar/RoundedAppBar.dart';
import 'package:Brisacliente/src/controllers/HomePageController.dart';
import 'package:flutter/material.dart';

class FinancialTab extends StatefulWidget {
  final HomePageController controller;

  const FinancialTab({Key key, this.controller}) : super(key: key);
  
  @override
  _FinancialTabState createState() => _FinancialTabState();
}

class _FinancialTabState extends State<FinancialTab> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFecf0f1),
      appBar: RoundedAppBar(title: "Financeiro"),
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
                      "Aqui você pode baixar sua fatura, alterar o vencimento solicitar desbloqueio de confiança e muito mais",
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
                            Icons.receipt,  
                            color: Color(0xFFf46e27),
                            size: height * 0.045,
                          ),
                          Text(
                            "Minhas faturas",
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
                            Icons.calendar_today,
                            color: Color(0xFFf46e27),
                            size: height * 0.045,
                          ),
                          Text(
                            "Alterar Vencimento",
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
                            Icons.monetization_on,
                            color: Color(0xFFf46e27),
                            size: height * 0.045,
                          ),
                          Text(
                            "Pagamento automático",
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
                            Icons.history,  
                            color: Color(0xFFf46e27),
                            size: height * 0.045,
                          ),
                          Text(
                            "Histórico de Transações",
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
                            Icons.payment,  
                            color: Color(0xFFf46e27),
                            size: height * 0.045,
                          ),
                          Text(
                            "Cartão Brisanet",
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