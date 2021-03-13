import 'package:Brisacliente/src/utils/dateToList.dart';
import 'package:intl/intl.dart';
import 'package:Brisacliente/src/components/CalendarBills/CalendarBills.dart';
import 'package:Brisacliente/src/components/RoundedAppBar/RoundedAppBar.dart';
import 'package:Brisacliente/src/controllers/BillsPageController.dart';
import 'package:Brisacliente/src/models/plan.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BillsPage extends StatefulWidget {
  BillsPage({Key key}) : super(key: key);
  @override
  _BillsPageState createState() => _BillsPageState();
}
          
class _BillsPageState extends State<BillsPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final BillsPageController controller =
        BillsPageController(ModalRoute.of(context).settings.arguments);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: RoundedAppBar(
        title: "Minhas fatura",
        hasBackIcon: true,
      ),
      backgroundColor: Color(0xFFecf0f1),
      body: Padding(
        padding: EdgeInsets.only(
          top: height * 0.05,
          left: width * 0.1,
          right: width * 0.1,
        ),
        child: FutureBuilder(
          future: controller.getBills(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.02),
                    child: CalendarBills(
                      controller: controller,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.65,
                    child: PageView(
                      controller: controller.pageController,
                      dragStartBehavior: DragStartBehavior.start,
                      physics: NeverScrollableScrollPhysics(),
                      children:  List<Widget>.generate(
                        controller.calendarBills.length, (index) {
                          List<Plan> plans = controller.plans;
                          double totalPrice = 10;
                          for (Plan plan in plans){
                            totalPrice += plan.price;
                          }
                          bool hasPaid = controller.calendarBills[index]["hasPaid"];
                          return SingleChildScrollView(
                            clipBehavior: Clip.none,
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                Container(
                                  width: width * 0.8,
                                  height: height * 0.3,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          hasPaid ? "Fatura Paga" : "Fatura Pendente",
                                          style: TextStyle(
                                            color: hasPaid ? Colors.green : Colors.red,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold
                                          )
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: height * 0.01),
                                          child: Text(
                                            "R\$ $totalPrice",
                                            style: TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF093d93)
                                            )
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: height * 0.01),
                                          child: Text(
                                            "${controller.address}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xFF093d93)
                                            )
                                          ),
                                        ),
                                        hasPaid ? Padding(
                                          padding: EdgeInsets.only(top:  height * 0.02),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFecf0f1),
                                                borderRadius: BorderRadius.circular(5)
                                              ),
                                              height: height * 0.055,
                                              child: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.calendar_today, 
                                                      size: height * 0.035, 
                                                      color: Color(0xFF093d93)
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(left: width * 0.025),
                                                      child: Text(
                                                        "Pago em ${controller.calendarBills[index]["paidAt"]}",
                                                        style: TextStyle(
                                                          color: Color(0xFF093d93),
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w300
                                                        )
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            )
                                          )
                                        : Container(),
                                        Padding(
                                          padding: EdgeInsets.only(top:  height * 0.01),
                                          child: TextButton(
                                            onPressed: () => {},
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                              side: MaterialStateProperty.all<BorderSide>(BorderSide(
                                                  color:  Color(0xFF093d93),
                                                ),
                                              ),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(5)
                                                )
                                              )
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.receipt, 
                                                  color: Color(0xFF093d93)
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: width * 0.025),
                                                  child: Text(
                                                    hasPaid ? "Baixar comprovante" : "Baixar boleto",
                                                    style: TextStyle(
                                                      color: Color(0xFF093d93),
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400
                                                    )
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                                  child: SizedBox(
                                    height: height * 0.01,
                                    width: width * 0.05,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFf46e27),
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                    ),
                                  ),
                                ),
                                LimitedBox(
                                  maxHeight: (plans.length * 75).toDouble(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: ListView.separated(
                                      physics: NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.symmetric(vertical: height * 0.01),
                                      itemBuilder: (context, i){
                                        Plan plan = plans[i];
                                        String date = controller.calendarBills[index]["expiry"];
                                        return ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: width * 0.025
                                          ),
                                          horizontalTitleGap: 1,
                                          leading: Container(
                                            width: width * 0.08,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "01",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF093d93)
                                                  )
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 2),
                                                  child: Text(
                                                    "${dateToList(date)[1]}",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w300,
                                                      color: Color(0xFF093d93)
                                                    )
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          title: Text(
                                            plan.title,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF093d93)
                                            )
                                          ),
                                          trailing: Text(
                                            "R\$ ${plan.price}",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300
                                            )
                                          ),
                                        );
                                      }, 
                                      separatorBuilder: (context, index) => Divider(
                                        indent: width * 0.05,
                                        color: Colors.black12,
                                      ),
                                      itemCount: plans.length,
                                    ),
                                  )
                                )
                              ],
                            ),
                          );
                        }
                      ),
                    ),
                  ),
                ],
              );
            }

            return Center(
              child: CircularProgressIndicator()
            );
          },
        )
      )
    );
  }
}
