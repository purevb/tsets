import 'package:flutter/material.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/screens/login.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  bool _isLogged = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(builder: (context, provider, child) {
      return provider.isLogged
          ? Center(
              child: ElevatedButton(
                onPressed: () {
                  provider
                      .Logout(); // Call Logout without expecting a return value
                },
                child: Text("Logout"),
              ),
            )
          : LoginPage();
    });
  }
}
