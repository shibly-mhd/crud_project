import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StudentView extends StatelessWidget {
  final String imagepath;
  final String name;
  final String classs;
  final String address;
  final String age;

  StudentView({
    super.key,
    required this.name,
    required this.classs,
    required this.age,
    required this.address,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal[200],
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              width: 300,
              height: 300,
              child: Card(
                color: Colors.teal[100],
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: FileImage(File(imagepath)),
                      child: InkWell(
                        onTap: () {},
                      ),
                      radius: 50,
                    ),
                    Gap(20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '$name',
                        ),
                        Text(
                          '$age',
                        ),
                        Text(
                          '$classs',
                        ),
                        Text(
                          '$address',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
