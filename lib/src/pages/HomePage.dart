import 'package:Brisacliente/src/components/PlansTab/PlansTab.dart';
import 'package:Brisacliente/src/components/StartTab/StartTab.dart';
import 'package:Brisacliente/src/controllers/HomePageController.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final HomePageController controller = HomePageController(
      ModalRoute.of(context).settings.arguments
    );
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
        length: 5, 
        child: Scaffold(
          backgroundColor: Color(0xFFecf0f1),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              StartTab(
                username: controller.getUserName()
              ),
              PlansTab(
                controller: controller
              ),
              Container(
                color: Colors.lightGreen,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.blue,
              ),
            ],
          ),
          bottomNavigationBar: SizedBox(
            height: height * 0.1,
            child: Container(
              color: Colors.white60,
              child: TabBar(
                tabs: [
                  Tab(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.dashboard),
                        Text(
                          "Início", 
                          style: TextStyle(
                            fontSize: 14
                          ),
                          softWrap: false,
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.folder),
                        Text(
                          "Planos",
                          style: TextStyle(
                            fontSize: 14
                          ),
                          softWrap: false,
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.monetization_on, size: 30),
                        Text(
                          "Finanças",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          softWrap: false,
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.settings),
                        Text(
                          "Suporte",
                          style: TextStyle(
                            fontSize: 14
                          ),
                          softWrap: false,
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.account_circle_rounded),
                        Text(
                          "Perfil",
                          style: TextStyle(
                            fontSize: 14
                          ),
                          softWrap: false,
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  )
                ],
                labelColor: Color(0xFF093d93),
                unselectedLabelColor: Colors.grey,
                labelStyle:TextStyle(
                  fontSize: 10
                ),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.transparent,
              ),
            ),
          ),
        )
    );
  }
}
