import 'package:Brisacliente/src/components/RoundedAppBar/RoundedAppBar.dart';
import 'package:Brisacliente/src/controllers/HomePageController.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  final HomePageController controller;

  const ProfileTab({Key key, this.controller}) : super(key: key);
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final List<Map<String, dynamic>> items = [
    {
      "title": "Meus dados",
      "subtitle": "Visualize ou edite seus dados",
      "icon": Icons.settings
    },
    {
      "title": "Minhas notificações",
      "subtitle": "Acompanhe suas notificações",
      "icon": Icons.notifications_active
    },
    {
      "title": "Meus contratos",
      "subtitle": "Contratos e pendências de assinatura",
      "icon": Icons.description
    },
    {
      "title": "Política de Privacidade",
      "subtitle": "Veja nossa política de privacidade",
      "icon": Icons.assignment
    },
    {
      "title": "Sobre",
      "subtitle": "Sobre desenvolvimento",
      "icon": Icons.info
    },
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFecf0f1),
      appBar: RoundedAppBar(title: "Meu Perfil"),
      body: Padding(
        padding: EdgeInsets.only(
            top: height * 0.035,
            left: width * 0.1,
            right: width * 0.1
        ),
        child: Column(
          children: [
            Container(
              height: height * 0.15,
              decoration: BoxDecoration(
                color: Color(0xFFf46e27),
                borderRadius: BorderRadius.circular(10)
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: width * 0.2,
                    height: height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Icon(
                      Icons.person,
                      color: Color(0xFF062a66),
                      size: width * 0.125
                    )
                  ),
                  SizedBox(
                    height: height * 0.2,
                    width: width * 0.5,
                    child: ListTile(
                      minVerticalPadding: height * 0.045,
                      title: Text(
                        "${this.widget.controller.getUserName()}",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400
                        )
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: height * 0.005),
                        child: Text(
                          "${this.widget.controller.getCpf()}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w300
                          )
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.025, bottom: height * 0.006),
              child: LimitedBox(
                maxHeight: (height * 0.1025 * this.items.length),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return ListTile(
                        leading: Padding(
                          padding: EdgeInsets.only(top: height * 0.005),
                          child: Icon(
                            this.items[index]["icon"],
                            color: Color(0xFFf46e27),
                            size: height * 0.04
                          ),
                        ),
                        title: Text(
                          this.items[index]["title"]
                        ),
                        subtitle: Text(
                          this.items[index]["subtitle"]
                        ),
                      );
                    }, 
                    separatorBuilder: (context, index) => Divider(
                      indent: width * 0.05,
                      color: Colors.black12,
                    ),
                    itemCount: this.items.length
                  ),
                ),
              ),
            ),
            TextButton(
              child: Text(
                "Desconectar",
                style: TextStyle(
                  color: Color(0xFFf46e27),
                  fontSize: 16
                )
              ),
              onPressed: (){
                this.widget.controller.logout();
                Navigator.popAndPushNamed(context, "/");
              }
            )
          ],
        ),
      )
    );
  }
}
