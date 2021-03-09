import 'package:Brisacliente/src/components/PlanWidget/PlanWidget.dart';
import 'package:Brisacliente/src/components/RoundedAppBar/RoundedAppBar.dart';
import 'package:Brisacliente/src/controllers/HomePageController.dart';
import 'package:Brisacliente/src/models/plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PlansTab extends StatefulWidget {
  final HomePageController controller;
  const PlansTab({Key key, this.controller}) : super(key: key);
  @override
  _PlansTabState createState() => _PlansTabState();
}

class _PlansTabState extends State<PlansTab> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFecf0f1),
      appBar: RoundedAppBar(title: "Meus Planos"),
      body: Padding(
        padding: EdgeInsets.only(
            top: height * 0.05,
            left: width * 0.1,
            right: width * 0.1
        ),
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.11,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Endereço",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF093d93)
                              )
                            ),
                            Text(
                              "Ativo",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.w400
                              ),
                            )
                          ],
                        ),
                        Observer(builder: (_) {
                          return Text("${this.widget.controller.address}",
                            style: TextStyle(color: Colors.grey)
                          );
                        })
                      ],
                    ),
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
              Observer(builder: (_) {
                List<Widget> plansWidget = [];
                List<Plan> plans = this.widget.controller.plans;

                if (plans == null){
                  return CircularProgressIndicator();
                }

                for (Plan plan in plans){
                  plansWidget.add(
                    PlanWidget(plan: plan)
                  );
                }
                return Container(
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: plansWidget
                  )
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
