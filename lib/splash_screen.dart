import 'dart:async';
import 'color_constant.dart';
import 'navPage.dart';
import 'sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences? prefs;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? password;

  @override
  void initState() {
    super.initState();
    nextPage();
  }

  Widget page = NavPage();

  void nextPage()async{
    prefs =await SharedPreferences.getInstance();
    firstName = prefs!.getString('fname');
    lastName = prefs!.getString('lname');
    email = prefs!.getString('email');
    phone = prefs!.getString('phone');
    password = prefs!.getString('password');

    if(firstName == null || lastName == null || email == null || phone == null || password == null){
      page = SignUpPage();
    }

    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return page;
    }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/app_logo.png"),
            Text("Monety",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ],
        ),
      ),
      body: Center(
        child: Container(
          height: 560,
          width: 310,
          child: Stack(
            children: [
              Positioned(
                bottom: 20,
                child: Container(
                  color: Colors.grey.shade100,
                  height: 350,
                  width: 310,
                  child: Column(
                    children: [
                      SizedBox(height: 160,),
                      Center(child: Text("Easy way to monitor your expense",textAlign: TextAlign.center,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),)),
                      SizedBox(height: 10,),
                      Center(child: Text("Safe your futute by monitoring your expense right now",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey.shade400,fontSize: 15),))

                    ],
                  ),
                ),
              ),
              Positioned(
                top: 1,
                child: Center(
                  child: Container(
                    height: 320,
                    width: 300,
                    child: Image.asset("assets/images/splash_img.png",fit: BoxFit.contain,),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 5,
                child: FloatingActionButton(onPressed: (){

                },
                  backgroundColor: ColorConstant.colors[0],
                child: Icon(Icons.arrow_right_alt_rounded,color: Colors.white,size: 30,),)
              )
            ],
          ),
        ),
      ),
    );
  }
}