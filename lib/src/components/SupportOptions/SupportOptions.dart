import 'package:flutter/material.dart';

class SupportOptions extends StatefulWidget {
  @override
  _SupportOptionsState createState() => _SupportOptionsState();
}

class _SupportOptionsState extends State<SupportOptions> {
  final List<Map<String, dynamic>> items = [
    {
      "title": "Meu Wi-fi",
      "subtitle": "Opções para seu Wi-fi",
      "icon": Icons.wifi
    },
    {
      "title": "FAQ",
      "subtitle": "Tire suas dúvidas",
      "icon": Icons.message
    },
    {
      "title": "Ligamos para você",
      "subtitle": "A gente pode te ajudar",
      "icon": Icons.phone
    }
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return  LimitedBox(
      maxHeight: height * 0.315,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: ListView.separated(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          itemCount: items.length,
          separatorBuilder: (context, index) => Divider(
            color: Colors.black,
          ),
          itemBuilder: (context, index){
            return ListTile(
              leading: Icon(items[index]["icon"], color: Color(0xFFf46e27), size: height * 0.04),
              title: Text(items[index]["title"],
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF062a66),
                  fontWeight: FontWeight.w600
                )
              ),
              subtitle: Text( 
                items[index]["subtitle"],
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF062a66),
                  fontWeight: FontWeight.w300
                )
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Color(0xFFf46e27),
                size: height * 0.05,
              ),
            );
          }
        ),
      )
    );
  }
}
