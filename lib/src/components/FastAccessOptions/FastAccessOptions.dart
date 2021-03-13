import 'package:flutter/material.dart';

class FastAccessOptions extends StatefulWidget {
  final String uid;

  const FastAccessOptions({Key key, this.uid}) : super(key: key);
  @override
  _FastAccessOptionsState createState() => _FastAccessOptionsState();
}

class _FastAccessOptionsState extends State<FastAccessOptions> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {
        "icon": Icons.description,
        "title": "Pagar fatura",
        "function" :  () => Navigator.pushNamed(context, "/bills", arguments: this.widget.uid),
      },
      {
        "icon": Icons.devices,
        "title": "Dispositivos conectados",
        "function" : () => {}
      }
    ];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.17,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: items.length,
        itemBuilder: (BuildContext context, index){
          return Padding(
            padding: EdgeInsets.only(right: 10),
            child: TextButton(
              onPressed: items[index]["function"],
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: width * 0.325,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        items[index]["icon"],
                        color: Color(0xFFf46e27),
                        size: height * 0.05,
                      ),
                      Text(
                        items[index]["title"],
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
            ),
          );
        },
      )
    );
  }
}
