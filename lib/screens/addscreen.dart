import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/function/functions.dart';
import 'package:flutter_application_1/model/model.dart';
import 'package:flutter_application_1/screens/screeninfo.dart';
import 'package:image_picker/image_picker.dart';

class addScreen extends StatefulWidget {
  const addScreen({super.key});

  @override
  State<addScreen> createState() => _addScreenState();
}

class _addScreenState extends State<addScreen> {
  final studentName = TextEditingController();

  final studentClass = TextEditingController();

  final studentAge = TextEditingController();

  final studentAddress = TextEditingController();

  final studentImage = TextEditingController();

  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
      ),
      backgroundColor: Colors.teal[100],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Card(
                  elevation: 20,
                  color: Colors.teal[50],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _pickImage();
                            },
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: _imageFile != null
                                  ? FileImage(_imageFile!)
                                  : null,
                              child: _imageFile == null
                                  ? const Icon(Icons.account_circle, size: 60)
                                  : null,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: studentName,
                            decoration: const InputDecoration(
                                hintText: 'Name', border: OutlineInputBorder()),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: studentAge,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                hintText: 'Age', border: OutlineInputBorder()),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: studentClass,
                            decoration: const InputDecoration(
                                hintText: 'Class',
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: studentAddress,
                            decoration: const InputDecoration(
                                hintText: 'Address',
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.teal[300]),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'cancel',
                                    style: TextStyle(color: Colors.white),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.teal[300]),
                                  onPressed: () {
                                    addStudentCheack(context);
                                  },
                                  child: const Text('Add',
                                      style: TextStyle(color: Colors.white))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Future addStudentCheack(BuildContext context) async {
    final stname = studentName.text;
    final stage = studentAge.text;
    final stclass = studentClass.text;
    final staddress = studentAddress.text;
    final getImage = _imageFile?.path ?? '';
    print(stname);

    final studentinfo = Student(
        name: stname,
        classs: stclass,
        address: staddress,
        age: stage,
        imagePath: '');

    if (stname.isNotEmpty &&
        staddress.isNotEmpty &&
        staddress.isNotEmpty &&
        stage.isNotEmpty) {
      addStudent(studentinfo);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => Screeninfo()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('fill the form to add details')));
    }
  }
}
