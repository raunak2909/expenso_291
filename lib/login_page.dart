import 'package:expanses_task11/sign_up_page.dart';

import 'ui/dashboard/dashBoard_page.dart';
import 'package:expanses_task11/navPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'color_constant.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  SharedPreferences? prefs;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login")),
      ),
      body: Container(
        padding: EdgeInsets.all(11),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              ColorConstant.colors[1].withOpacity(0.4),
              ColorConstant.colors[3].withOpacity(0.4),
              ColorConstant.colors[5].withOpacity(0.4),
            ],
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "abc@gmail.com",
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: true,
                obscuringCharacter: "*",
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: "Enter your password",
                    labelText: "Password",
                    prefixIcon: _obscureText == true
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onTap: () {
                  _obscureText = false;
                  setState(() {});
                },
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  bool check = await checkInfo();
                  check == false
                      ? Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }))
                      : Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                          return NavPage();
                        }));
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ),
              ),

              InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                      return SignUpPage();
                    }));
                  },
                  child: Text("Don't have an account? Create now",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))
            ],
          )),
    );
  }

  String? email;
  String? password;

  Future<bool> checkInfo() async {
    prefs = await SharedPreferences.getInstance();
    email = prefs!.getString('email');
    password = prefs!.getString('password');
    if (email == emailController.text.toString() &&
        password == passwordController.text.toString()) {
      return true;
    } else {
      return false;
    }
  }
}
