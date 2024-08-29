import 'dashBoard_page.dart';
import 'package:flutter/material.dart';

import 'color_constant.dart';

class NavPage extends StatefulWidget{
  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  List<Widget> navPages = [
    DashBoardPage(),
    Container(),
    Container(),
    Container(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navPages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home_filled,color: ColorConstant.colors[0],size: 30,), label: "Home"),
          NavigationDestination(icon: Icon(Icons.bar_chart,color: Colors.grey.shade400,size: 30,), label: "Bar Chart"),
          NavigationDestination(icon: Icon(Icons.notifications_none_rounded,size: 30,color: Colors.grey.shade400,), label: "Notifications"),
          NavigationDestination(icon: Icon(Icons.lightbulb_outline_sharp,color: Colors.grey.shade400,size: 30,), label: "More")
        ],
        onDestinationSelected: (val){
          selectedIndex = val;
          setState(() {

          });
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){

      },
        backgroundColor: ColorConstant.colors[0],
        child: Icon(Icons.add,size:30,color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,

    );
  }
}