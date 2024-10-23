import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 30,
        backgroundColor: Colors.blue,
        title: const Text("Log in "),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 214, 220, 223),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //
              //USERNAME FIELD
              //

              TextFormField(
                controller: _usernameController,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: "username or Email",
                    border: OutlineInputBorder(),
                    hintText: "username or Email"),
              ),
              //GAP
              SizedBox(height: size.height / 30),
              //
              //PASSWORD FIELD
              //

              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'password',
                    border: OutlineInputBorder(),
                    hintText: "password"),
              ),
              SizedBox(
                height: size.height / 20,
              ),
              //
              //LOGIN PAGE
              //
              ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  child: const Text("Log in ")),
              //
              //GAP
              //
              SizedBox(
                height: size.height / 200,
              ),

              //
              //SIGN UP BUTTON
              //
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signup(),
                      ));
                },
                icon: const Icon(Icons.lock_open_sharp),
                label: const Text('sign up'),
              )
            ],
          ),
        ),
      ),
    );
    //
  }

  void login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final saveduser = prefs.getString(usernamekey);
    final savedpass = prefs.getString(passkey);
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (saveduser == username && savedpass == password) {
      prefs.setBool(isloggedIn, true);
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("error")));
    }
  }
}
