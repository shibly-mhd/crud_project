import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/addscreen.dart';

class Todo extends StatelessWidget {
  Todo({super.key});

  final studentName = TextEditingController();
  final studentClass = TextEditingController();
  final studentAge = TextEditingController();
  final studentAddress = TextEditingController();
  final studentImage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: Colors.red,
              size: 30,
            ),

            //
            //
            Container(
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
      //
      body: Container(
        padding: EdgeInsets.only(
          top: 600,
          left: 300,
        ),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              child: Row(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => addScreen(),
                          ));
                    },
                    child: Icon(Icons.add),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.amber,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
