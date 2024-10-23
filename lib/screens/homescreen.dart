import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/screens/screeninfo.dart';
import 'package:flutter_application_1/screens/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 224, 218),
      // appBar: AppBar(
      //   title: Text("Home page "),
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 60, left: 50, right: 50),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'HOME',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(220, 0, 0, 0)),
                  ),
                  //gap between icon and text

                  Expanded(child: Container()),

                  //
                  //first arrow
                  const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Color.fromARGB(218, 6, 0, 0),
                  ),
                  //
                  //calender icon
                  SizedBox(
                    width: size.height / 90,
                  ),
                  const Icon(
                    Icons.calendar_month,
                    size: 20,
                    color: Colors.black,
                  ),
                  //
                  // forward icon
                  SizedBox(
                    width: size.height / 90,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.black,
                  )
                ],
              ),
              SizedBox(
                height: size.height / 35,
              ),
              // next row
              //
              Row(
                children: [
                  const Text(
                    ' Personal  Info ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decorationThickness: 50,
                        color: Color.fromARGB(156, 6, 94, 51)),
                  ),
                  //
                  //the gap between column

                  Expanded(child: Container()),
                  // the details text
                  GestureDetector(
                    onTap: () {
                      checkLogd();
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(245, 201, 109, 16)),
                    ),
                  ),
                  SizedBox(
                    width: size.height / 100,
                  ),

                  const Icon(Icons.forward, size: 20, color: Colors.black)
                ],
              ),
              SizedBox(
                height: size.height / 40,
              ),
              //
              //container

              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(81, 178, 96, 160),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        const Color.fromARGB(255, 6, 236, 236).withGreen(90),
                        const Color.fromARGB(255, 119, 10, 67).withBlue(90),
                      ]),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(80),
                      bottomRight: Radius.circular(10)),
                ),
                //
                //text inside
                //
                child: Container(
                  padding: const EdgeInsets.only(left: 20, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'student data',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.w900),
                      ),
                      //
                      //next line
                      //gap between
                      SizedBox(height: size.height / 90),
                      //next line
                      const Text(
                        'save your Notes',
                        style: TextStyle(
                            fontSize: 19,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w900),
                      ),
                      //gap
                      SizedBox(height: size.height / 90),
                      //next line
                      const Text(
                        'and images and Data ',
                        style: TextStyle(
                            fontSize: 21,
                            color: Colors.black87,
                            fontWeight: FontWeight.w900),
                      ),
                      //gap
                      SizedBox(
                        height: size.height / 40,
                      ),
                      Row(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.school_sharp,
                                size: 30,
                                color: Colors.blueAccent,
                              ),
                              SizedBox(
                                width: size.height / 80,
                              ),
                              //next text
                              //
                              const Padding(
                                padding: EdgeInsets.only(top: 70),
                                child: Text(
                                  'whole school data',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 29, 2, 39)),
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          //
                          Padding(
                            padding: const EdgeInsets.only(right: 20, top: 50),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(130),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.blue,
                                        blurRadius: 18,
                                        offset: Offset(10, 10))
                                  ]),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Screeninfo(),
                                      ));
                                },
                                icon: const Icon(Icons.play_circle),
                                color: Colors.white,
                                iconSize: 45,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              //
              //gap between the two container
              SizedBox(
                height: size.height / 80,
              ),
              //second section
              //
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                // color: Colors.red,

                // to add overlay images use stack
                //
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 30),
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage('assets/school1.jpg'),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 20,
                              offset: Offset(2, 10),
                              color: Colors.blue,
                            ),
                            BoxShadow(
                              blurRadius: 20,
                              offset: Offset(-2, -10),
                              color: Color.fromARGB(255, 216, 229, 239),
                            ),
                          ]),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void checkLogd() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(isloggedIn, false);
  }
}
