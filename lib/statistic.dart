import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'color_constant.dart';

class Statistic_page extends StatelessWidget{

  List<Map<String,dynamic>>mList =[
    //Shop
    {
      "container" : Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      "icon" : Icon(Icons.shopping_cart_outlined,color:ColorConstant.colors[1],size: 30,),
      "name" : "Shop",
      "rupee" : "-\$1190"
    },
    //Tranportation
    {
      "container" : Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      "icon" : Icon(Icons.emoji_transportation,color:ColorConstant.colors[4],size: 30,),
      "name" : "Tranpo..",
      "rupee" : "-\$867"
    },
    //Electronics
    {
      "container" : Container(
      height: 45,
    width: 45,
    decoration: BoxDecoration(
    color: Colors.orange.shade50,
    borderRadius: BorderRadius.circular(5),
    ),
    ),
      "icon" : Icon(Icons.phone_android_outlined,color:ColorConstant.colors[2],size: 30,),
      "name" : "Electro..",
      "rupee" : "-\$1290"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Statistic",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              Stack(
                children: [
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                        color: ColorConstant.colors[6],
                        borderRadius: BorderRadius.circular(4)
                    ),
                  ),
                  Positioned(
                    top: 2,
                    left: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("This Month",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                        Icon(Icons.arrow_drop_down_sharp,),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: ColorConstant.colors[1],
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total expenses",style: TextStyle(color: Colors.white),),
                          Stack(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade50.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              Positioned(
                                  left: 3,
                                  top: 3,
                                  child: Icon(Icons.more_horiz_rounded,color: Colors.white,))
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.0),
                      child: RichText(
                          text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: "\$3,734",style: TextStyle(color: Colors.white,fontSize: 25)),
                                TextSpan(text: "  "),
                                TextSpan(text: "/\$4000 per month",style: TextStyle(color: Colors.grey.shade400.withOpacity(0.7),fontSize: 12))
                              ]
                          )),
                    ),
                    Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                        child: Stack(
                          children: [
                            Container(
                              height: 6,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade400.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            Container(
                              height: 6,
                              width: 240,
                              decoration: BoxDecoration(
                                  color: ColorConstant.colors[2],
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Expense Breakdown",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                        Text("Limit \$900 / week",style: TextStyle(fontSize: 13,color: Colors.grey.shade600),)
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                              color: ColorConstant.colors[6],
                              borderRadius: BorderRadius.circular(3)
                          ),
                        ),
                        Positioned(
                          left: 9,
                          top: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Week",style: TextStyle(color: Colors.black,),),
                              Icon(Icons.arrow_drop_down_outlined)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 183,
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(" "),
                        Container(
                            height: 25,
                            width: 40,
                            decoration: BoxDecoration(
                              color: ColorConstant.colors[4],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(child: Text("\$900",style: TextStyle(color: Colors.white70,fontSize: 13),))),
                        SizedBox(height: 5,),
                        Text("\$600",style: TextStyle(color: Colors.grey.shade400),),
                        SizedBox(height: 5,),
                        Text("\$300",style: TextStyle(color: Colors.grey.shade400),),
                        SizedBox(height: 5,),
                        Text("\$300",style: TextStyle(color: Colors.grey.shade400),),
                        SizedBox(height: 5,),
                        Text("\$0",style: TextStyle(color: Colors.grey.shade400),),
                        Text(" ",style: TextStyle(color: Colors.grey.shade400),),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 110,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: ColorConstant.colors[3],
                                  borderRadius: BorderRadius.circular(4)
                              ),
                            ),
                            Positioned(
                                bottom: 4,
                                left: 1,
                                child: Text("\$850",style: TextStyle(color: Colors.white70,fontSize: 13),))
                          ],
                        ),
                        SizedBox(height: 9,),
                        Text("W1",style: TextStyle(color: Colors.grey.shade400),)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 120,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: ColorConstant.colors[3],
                                  borderRadius: BorderRadius.circular(4)
                              ),
                            ),
                            Positioned(
                                bottom: 4,
                                left: 1,
                                child: Text("\$850",style: TextStyle(color: Colors.white70,fontSize: 13),))
                          ],
                        ),
                        SizedBox(height: 9,),
                        Text("W2",style: TextStyle(color: Colors.grey.shade400),)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 100,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: ColorConstant.colors[3],
                                  borderRadius: BorderRadius.circular(4)
                              ),
                            ),
                            Positioned(
                                bottom: 4,
                                left: 1,
                                child: Text("\$622",style: TextStyle(color: Colors.white70,fontSize: 13),))
                          ],
                        ),
                        SizedBox(height: 9,),
                        Text("W3",style: TextStyle(color: Colors.grey.shade400),)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 150,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: ColorConstant.colors[4],
                                  borderRadius: BorderRadius.circular(4)
                              ),
                            ),
                            Positioned(
                                bottom: 4,
                                left: 1,
                                child: Text("\$960",style: TextStyle(color: Colors.white70,fontSize: 13),))
                          ],
                        ),
                        SizedBox(height: 9,),
                        Text("W4",style: TextStyle(color: Colors.grey.shade400),)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 130,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: ColorConstant.colors[3],
                                  borderRadius: BorderRadius.circular(4)
                              ),
                            ),
                            Positioned(
                                bottom: 4,
                                left: 1,
                                child: Text("\$732",style: TextStyle(color: Colors.white70,fontSize: 13),))
                          ],
                        ),
                        SizedBox(height: 9,),
                        Text("W5",style: TextStyle(color: Colors.grey.shade400),)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Spending Details",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                  Text("Your expenses are divided into 6 categories",style: TextStyle(color: Colors.grey.shade900,fontSize: 14),)
                ],
              ),
              SizedBox(height: 15,),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 10,
                        width: 330,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: ColorConstant.colors[5],
                        ),
                      ),
                      Container(
                        height: 10,
                        width: 290,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: ColorConstant.colors[4],
                        ),
                      ),
                      Container(
                        height: 10,
                        width: 240,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: ColorConstant.colors[3],
                        ),
                      ),
                      Container(
                        height: 10,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: ColorConstant.colors[2],
                        ),
                      ),
                      Container(
                        height: 10,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: ColorConstant.colors[0],
                        ),
                      ),
                      Container(
                        height: 10,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: ColorConstant.colors[1],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text("30%",style: TextStyle(color: Colors.black,fontSize: 13),),
                      SizedBox(width: 16,),
                      Text("17%",style: TextStyle(color: Colors.black,fontSize: 13),),
                      SizedBox(width: 16,),
                      Text("40%",style: TextStyle(color: Colors.black,fontSize: 13),),
                      SizedBox(width: 37,),
                      Text("35%",style: TextStyle(color: Colors.black,fontSize: 13),),
                      SizedBox(width: 37,),
                      Text("30%",style: TextStyle(color: Colors.black,fontSize: 13),),
                      SizedBox(width: 30,),
                      Text("25%",style: TextStyle(color: Colors.black,fontSize: 13),),
                    ],
                  )
                ],
              ),
              SizedBox(height: 15,),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: double.infinity),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4/2,
                  ),
                  itemBuilder: (_,Index){
                    return Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Container(
                        height: 80,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400,width: 2),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Stack(
                                children: [
                                  mList[Index]["container"],
                                  Positioned(
                                      top: 7,
                                      left: 7,
                                      child: mList[Index]['icon']
                                  )
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(mList[Index]['name'],style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                                Text(mList[Index]['rupee'],style: TextStyle(color: ColorConstant.colors[0]),)
                              ],
                            ),
                            SizedBox(width:10,),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 2,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey.shade400,width: 1))
                ),
              ),
              SizedBox(height: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.home_filled,color: ColorConstant.colors[0],size: 30,),
                  Icon(Icons.bar_chart,color: Colors.grey.shade400,size: 30,),
                  FloatingActionButton(onPressed: (){

                  },
                    backgroundColor: ColorConstant.colors[0],
                    child: Icon(Icons.add,size:30,color: Colors.white,),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Icon(Icons.notifications_none_rounded,size: 30,color: Colors.grey.shade400,),
                  ),
                  Icon(Icons.lightbulb_outline_sharp,color: Colors.grey.shade400,size: 30,)
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}