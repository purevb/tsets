import 'package:flutter/material.dart';
import 'package:movie/global_keys.dart';
import 'package:movie/providers/common.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  final _phoneCtrl = TextEditingController();

  final _passCtrl = TextEditingController();

  void onSubmit() {
      Provider.of<CommonProvider>(MyGlobalKeys.navigatorKey.currentContext!, listen: false).Login(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's sign you in",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Welcome back",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      Text(
                        "Have you been missed",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Buglu ';
                          }
                          return null;
                        },
                        controller: _phoneCtrl,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Phone Number"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Buglu";
                          }
                          return null;
                        },
                        controller: _passCtrl,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Password"),
                      )
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text('Sign in'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black),
                      onPressed: onSubmit,
                    ),
                  )
                ],
              ),
            )));
  }
}
