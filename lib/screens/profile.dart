import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/screens/login.dart';
import 'package:movie/service/api/index.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void _onHttpRequest() async {
    final api = ApiService();
    final data =await api.getRequest("/user");
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(builder: (context, provider, child) {
      return provider.isLoggedin
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: _onHttpRequest, child: Text("Request")),
                  ElevatedButton(
                    onPressed: () {
                      provider.Logout();
                    },
                    child: Text("Logout"),
                  ),
                ],
              ),
            )
          : LoginPage();
    });
  }
}
