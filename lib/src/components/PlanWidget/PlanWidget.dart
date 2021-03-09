import 'package:Brisacliente/src/models/plan.dart';
import 'package:flutter/material.dart';

class PlanWidget extends StatelessWidget {
  final Plan plan;

  const PlanWidget({Key key, this.plan}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${plan.type}",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xFF093d93)
          )
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.015
          ),
          child: Text("${plan.title}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF093d93)
            )
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: height * 0.05),
          child: SizedBox(
            height: height * 0.17,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: plan.options.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Container(
                    width: width * 0.18,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            plan.options[index]["icon"],
                            color: Color(0xFFf46e27),
                            size: height * 0.045,
                          ),
                          Text(
                            plan.options[index]["title"],
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
                );
              }
            ),
          ),
        ),
      ],
    );
  }
}