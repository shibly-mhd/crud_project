import 'package:flutter/material.dart';
import 'package:flutter_application_1/function/functions.dart';
import 'package:flutter_application_1/screens/LOGIN.dart';
import 'package:flutter_application_1/screens/addscreen.dart';
import 'package:flutter_application_1/screens/editscreen.dart';
import 'package:flutter_application_1/screens/studentview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screeninfo extends StatelessWidget {
  const Screeninfo({super.key});

  Future logOut(BuildContext context) async {
    final sharedpref = await SharedPreferences.getInstance();
    await sharedpref.clear();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal[200],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => addScreen()));
        },
        backgroundColor: Colors.teal[400],
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () {
        //       logOut(context);
        //     },
        //     icon: Icon(Icons.logout)),
        // backgroundColor: Colors.teal[400],
        // title: Text('Home Screen'),
        backgroundColor: Colors.amberAccent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.menu,
              color: Colors.red,
              size: 30,
            ),

            //
            //
            SizedBox(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/sticker.jpg'),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        child: ValueListenableBuilder(
          valueListenable: studentListNotifier,
          builder: (context, ListStudent, child) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final studentData = ListStudent[index];
                return Card(
                  elevation: 10,
                  color: Colors.teal[100],
                  margin: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          (MaterialPageRoute(
                              builder: (ctx) => StudentView(
                                    imagepath: studentData.imagePath.toString(),
                                    name: studentData.name.toString(),
                                    classs: studentData.classs.toString(),
                                    address: studentData.address.toString(),
                                    age: studentData.age.toString(),
                                  ))));
                    },
                    leading: const CircleAvatar(
                      radius: 30,
                    ),
                    title: Text(studentData.name.toString()),
                    subtitle: Text(studentData.age.toString()),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => editscreen(
                                            image: "",
                                            name: "",
                                            age: '',
                                            address: "",
                                            key: key,
                                            index: index,
                                            classs: '',
                                          )));
                            },
                            icon: const Icon(Icons.edit)),
                        const SizedBox(
                          width: 1,
                        ),
                        IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Colors.teal[400],
                                      content: Text(
                                        '${studentData.name} deleted,',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )));
                              deleteStudent(index);
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  ),
                );
              },
              itemCount: ListStudent.length,
            );
          },
        ),
      ),
    );
  }
}
