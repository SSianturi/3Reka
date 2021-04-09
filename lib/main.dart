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
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Welcome Back to 3Reka",
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
                    "Helping You Creating An Impact",
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
                        image: AssetImage("assets/images/IMG_20210317_113222.jpg")
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
    );
  }
}