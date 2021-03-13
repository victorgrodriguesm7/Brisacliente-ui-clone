import 'package:Brisacliente/src/controllers/BillsPageController.dart';
import 'package:Brisacliente/src/utils/dateToList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CalendarBills extends StatefulWidget {
  final BillsPageController controller;
  const CalendarBills({Key key, this.controller, }) : super(key: key);
  @override
  _CalendarBillsState createState() => _CalendarBillsState();
}

class _CalendarBillsState extends State<CalendarBills> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> calendarBills = this.widget.controller.calendarBills;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.15,
      child: RotatedBox(
        quarterTurns: 3,
        child: Observer(
          builder: (_){
            return ListWheelScrollView(
              clipBehavior: Clip.none,
              diameterRatio: 10,
              itemExtent: 100,
              physics: FixedExtentScrollPhysics(),
              controller: FixedExtentScrollController(
                initialItem: this.widget.controller.tabIndex
              ),
              onSelectedItemChanged: (index){
                this.widget.controller.setTabIndex(index);
              },
              children:  List<Widget>.generate((calendarBills.length), (index){
                  Map<String, dynamic> calendarBill = calendarBills[index];
                  List<String> expiryDate = dateToList(calendarBill["expiry"]);
                  String day = expiryDate[0];
                  String month = expiryDate[1];
                  String year = expiryDate[2];
                  bool isSelected = this.widget.controller.tabIndex == index;
                  return RotatedBox(
                    quarterTurns: 1,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Container(
                        width: width * 0.25,
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "$month",
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.grey,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w300
                                  )
                                ),
                                Text(
                                  "$day",
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.grey,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400
                                  )
                                ),
                                Text(
                                  "$year",
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w200
                                  )
                                )
                              ],
                            )),
                        decoration: BoxDecoration(
                          color:  isSelected ? Color(0xFFf46e27) : Color(0xFFdce2f0),
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                  );
                }
              )
            );
          }
        )
      )
    );
  }
}
