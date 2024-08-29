import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'color_constant.dart';

class DashBoardPage extends StatefulWidget {
  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  SharedPreferences? prefs;

  String? fname;
  String? lname;

  @override
  void initState() {
    findProfileName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 30,))
          ],
      ),
      drawer: Drawer(

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*-------------------Profile------------------*/
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ListTile(
                title: Text(
                  "Morning",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/contact_avatar.png"),
                ),
                subtitle: Text(
                  "${fname} ${lname}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Container(
                  height: 25,
                  width: 90,
                  child: Stack(
                    children: [
                      Container(
                        height: 25,
                        width: 90,
                        decoration: BoxDecoration(
                            color: ColorConstant.colors[6],
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      Positioned(
                        left: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "This Month",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_drop_down_sharp,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            /*-------------------Expense Total------------------*/
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 130,
                width: 400,
                decoration: BoxDecoration(
                  color: ColorConstant.colors[1],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Expense total",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "\$ 3,737",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: ColorConstant.colors[4],
                                        borderRadius: BorderRadius.circular(3)),
                                  ),
                                  Positioned(
                                      top: 2,
                                      left: 4,
                                      child: Center(
                                          child: Text(
                                        "+\$340",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 11),
                                      )))
                                ],
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "then last month",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 12),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                      Expanded(
                        child: Image.asset(
                          "assets/images/Box_image.png",
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            /*-------------------Expense List Name------------------*/
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Expense List",
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            /*-------------------Expense List------------------*/
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                      child: Row(
                        children: [
                          Text("Tuesday,",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18)),
                          Text("14",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18)),
                          Expanded(
                              child: SizedBox(
                            width: 0,
                          )),
                          Text("-\$1380",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        height: 2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey.shade400, width: 1))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: ListTile(
                        leading: Stack(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            Positioned(
                                top: 7,
                                left: 7,
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: ColorConstant.colors[1],
                                  size: 30,
                                ))
                          ],
                        ),
                        title: Text(
                          "Shop",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Buy new clothes",
                          style: TextStyle(fontSize: 12),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        trailing: Text(
                          "-\$90",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorConstant.colors[0],
                              fontSize: 17),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: ListTile(
                        leading: Stack(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: Colors.orange.shade50,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            Positioned(
                                top: 7,
                                left: 7,
                                child: Icon(
                                  Icons.phone_android_outlined,
                                  color: ColorConstant.colors[2],
                                  size: 30,
                                ))
                          ],
                        ),
                        title: Text(
                          "Electronics",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Buy new iPhone 14",
                          style: TextStyle(fontSize: 12),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        trailing: Text(
                          "-\$1290",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorConstant.colors[0],
                              fontSize: 17),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            /*-------------------Transportation------------------*/
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 122,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                      child: Row(
                        children: [
                          Text("Monday,",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18)),
                          Text("13",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18)),
                          Expanded(
                              child: SizedBox(
                            width: 0,
                          )),
                          Text("-\$60",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        height: 2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey.shade400, width: 1))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: ListTile(
                        leading: Stack(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: Colors.red.shade50,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            Positioned(
                                top: 7,
                                left: 7,
                                child: Icon(
                                  Icons.emoji_transportation,
                                  color: ColorConstant.colors[4],
                                  size: 30,
                                ))
                          ],
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        title: Text(
                          "Tranportation",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Trip to malang",
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Text(
                          "-\$60",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorConstant.colors[0],
                              fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            /*-------------------Divider------------------*/
            Container(
              height: 2,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.grey.shade400, width: 1))),
            ),
          ],
        ),
      ),
    );
  }

  void findProfileName() async {
    prefs = await SharedPreferences.getInstance();
    fname = prefs!.getString('fname');
    lname = prefs!.getString('lname');
    setState(() {});
  }
}
