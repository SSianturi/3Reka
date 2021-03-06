import 'package:flutter/material.dart';
import 'package:threereka_tia/camerascreen.dart';
import 'package:camera/camera.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            },
          icon: Icon(Icons.arrow_back_ios,
          size: 20,
            color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: (
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [GestureDetector(
              onTap: (){
                (Navigator.push(context, MaterialPageRoute(
                    builder: (context) => TakePictureScreen())));
              },
              child: (
              (Image.asset("assets/images/0001 (2).jpg",
                    fit: BoxFit.cover))),
    ),
    ],
    )),
      )
    ));
  }
}