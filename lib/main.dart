import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:threereka_tia/signin.dart';
import 'package:threereka_tia/signup.dart';

void  main (){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstPage (),
  ));
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/0002.jpg"),
        fit: BoxFit.cover,
        ),
      ),
    ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Welcome Back to 3Reka",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Together We Create An Impact",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.green[300],
                      fontSize: 15,

                    ),
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/0001 (2).jpg")
                    )
                ),
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                    },
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.yellow),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                      height:20),
                  MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()));
                      },
                    color: Colors.green[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
    ]);
  }
}