import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/function/functions.dart';
import 'package:flutter_application_1/model/model.dart';
import 'package:image_picker/image_picker.dart';

class editscreen extends StatefulWidget {
  String? name;
  String? classs;
  String? address;
  String? age;
  String? image;
  int? index;

  editscreen(
      {super.key,
      required this.name,
      required this.classs,
      required this.address,
      required this.age,
      required this.image,
      required this.index});

  @override
  State<editscreen> createState() => _editscreenState();
}

class _editscreenState extends State<editscreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _classController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  File? _slctImg;

  // TextEditingController _imagesController=TextEditingController();
  // File? _image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    _nameController = TextEditingController(text: widget.name);
    _classController = TextEditingController(text: widget.classs);
    _ageController = TextEditingController(text: widget.age);
    _addressController = TextEditingController(text: widget.address);
    _slctImg = widget.image != '' ? File(widget.image!) : null;

    return Scaffold(
      backgroundColor: Colors.teal[200],
      appBar: AppBar(
        title: const Text('Edit Student'),
        backgroundColor: Colors.teal[400],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            // color: Colors.[100],
            padding: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      contentPadding: EdgeInsets.all(10),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _ageController,
                    decoration: const InputDecoration(
                      labelText: 'Age',
                      contentPadding: EdgeInsets.all(10),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _classController,
                    decoration: const InputDecoration(
                      labelText: 'Class',
                      contentPadding: EdgeInsets.all(10),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _addressController,
                    decoration: const InputDecoration(
                      labelText: 'Address',
                      contentPadding: EdgeInsets.all(10),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      updateAll();
                      Navigator.pop(context);
                    },
                    child: const Text('Update'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateAll() async {
    final namee = _nameController.text;
    final agee = _ageController.text;
    final classe = _classController.text;
    final addresse = _addressController.text;

    final Image1 = _slctImg?.path ?? "";

    if (namee.isEmpty || agee.isEmpty || classe.isEmpty || addresse.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all fields')));
    } else {
      final update = Student(
        name: namee,
        age: agee,
        classs: classe,
        address: addresse, imagePath: '',
        // images: Image1
      );

      //

      editing(widget.index, update);

      log("message");
    }
  }

  Future _pickImageGllry() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _slctImg = File(pickedFile.path);
      });
    }
  }
}
