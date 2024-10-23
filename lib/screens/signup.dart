import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //the function to controll the username an password and store the details

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // final TextEditingController usernamecontroller = TextEditingController();

  // final TextEditingController passwordcontroller = TextEditingController();

  // Future<void> register(String username, String password) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('username', username);
  //   await prefs.setString('password', password);
  //   await prefs.setBool('isLoggedIn', false);

  //   //sign up function
  //   void signUp() {

  //     String username = usernameController.text;
  //     String password = passwordController.text;

  //     if (username.isNotEmpty && password.isNotEmpty) {
  //       register(username, password);
  //       // Navigate to  the login page or a success page
  //       Navigator.pushReplacementNamed(context, '/login');
  //     } else {
  //       // Handle empty fields
  //       print('Please fill in all fields');
  //     }
  //   }

  //   Navigator.pushReplacementNamed(context, '/home');
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65), // Height of the AppBar
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(355, 8, 197, 150), // AppBar background color
            borderRadius: BorderRadius.all(Radius.circular(80)
                // Add border radius
                ),

            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 15,
                blurRadius: 20,
              ),
            ],
          ),
          child: AppBar(
            title: const Text('Sign up'),
            backgroundColor:
                Color.fromARGB(0, 121, 50, 50), // To make it transparent
            elevation: 0, // Remove default AppBar shadow
            centerTitle: true,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //
                //USERNAME FIELD
                //

                TextFormField(
                  // condition for validation

                  controller: usernameController,

                  decoration: InputDecoration(
                      labelText: "username or Email",
                      border: OutlineInputBorder(),
                      hintText: "username or Email"),
                ),
                //GAP
                SizedBox(height: size.height / 30),
                //
                //PASSWORD FIELD

                TextFormField(
                  //  // condition for validation

                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter ur password';
                    } else {
                      return null;
                    }
                  },
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'password',
                      border: OutlineInputBorder(),
                      hintText: "password"),
                ),
                // SizedBox(
                //   height: size.height / 20,
                // ),
                //
                //LOGIN PAGE
                //
                // TextFormField(
                //   decoration: InputDecoration(
                //       labelText: 'phone number ',
                //       border: OutlineInputBorder(),
                //       hintText: "password "),
                // ),
                //
                //GAP
                //
                SizedBox(
                  height: size.height / 20,
                ),

                //
                //SIGN UP BUTTON
                //
                ElevatedButton.icon(
                  onPressed: () {
                    signUpbtn();
                  },
                  icon: Icon(Icons.app_registration_sharp),
                  label: Text('Register  '),
                ),
                // ElevatedButton.icon(
                //   onPressed: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => Homescreen(),
                //         ));
                //   },
                //   icon: Icon(Icons.mark_as_unread_outlined),
                //   label: Text('Direct login   '),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUpbtn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final username = usernameController.text;
    final password = passwordController.text;
    if (username.isNotEmpty && password.isNotEmpty) {
      prefs.setBool(isloggedIn, true);
      prefs.setString(usernamekey, username);
      prefs.setString(passkey, password);
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }
}

final usernamekey = 'username';
final passkey = 'password';
final isloggedIn = 'isloggedin';
