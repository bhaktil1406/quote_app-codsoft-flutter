import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:today_quotes/home.dart';
import 'package:today_quotes/user.dart';

class index extends StatefulWidget {
  const index({super.key});

  @override
  State<index> createState() => _indexState();
}

class _indexState extends State<index> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 233, 116, 253),
              Color.fromARGB(255, 80, 192, 240)
            ],
            // begin: Alignment.bottomLeft,
            // end: Alignment.topRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(80),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 20.0,
                      spreadRadius: 7.0),
                ],
              ),
              height: 150,
              width: 150,
              child: Image.asset("assets/2.png"),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 70,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 20.0,
                      spreadRadius: 0.0),
                ],
              ),
              child: Center(
                child: Text(
                  "Today Quotes",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
        // Center(
        //   child: Stack(
        //     children: [
        //       Positioned(
        //         top: 0,
        //         left: 0,
        //         child: SizedBox(
        //           height: 20,
        //           width: 20,
        //           child: Image.asset("assets/3.png"),
        //         ),
        //       ),
        //       Positioned(
        //         right: -90,
        //         bottom: -110,
        //         child: SizedBox(
        //           height: 40,
        //           width: 40,
        //           child: Image.asset("assets/4.png"),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
