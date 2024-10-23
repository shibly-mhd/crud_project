import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(14, 135, 162, 1),
          Color.fromRGBO(52, 203, 220, 1)
        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: Column(
          children: [
            SizedBox(height: size.height / 15),

            //material is for customizing the image and its properties
            //
            Material(
              elevation: 30,
              borderRadius: BorderRadius.circular(300),
              color: const Color.fromARGB(255, 144, 195, 204),
              //contains image and its properties
              child: Container(
                  width: size.height / 1.8,
                  height: size.height / 1.9,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/girl.png'),
                          fit: BoxFit.contain))),
            ),
            SizedBox(
              height: size.height / 20,
            ),
            //text
            //
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: SizedBox(
                height: size.height / 15,
                width: size.height / 1.15,
                child: const Text(
                  "welcome",
                  style: TextStyle(
                      fontSize: 38,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            //text
            //
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: SizedBox(
                height: size.height / 15,
                width: size.height / 1.15,
                child: const Text(
                  'get into the your profiles',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 20,
            ),
            // icon for loading
            Container(
              height: size.height / 20,
              width: size.height / 20,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                color: Colors.purple,
              ),
            ),
            SizedBox(
              height: size.height / 30,
            ),

            //
            Container(
              alignment: Alignment.center,
              child: const Text(
                'please wait',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromARGB(255, 130, 98, 167)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final checklogin = prefs.getBool(isloggedIn);
    ///////
    if (checklogin == true) {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, '/home');
      });
    } else {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, '/login');
      });
    }
  }
}
