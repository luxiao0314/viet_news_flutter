import 'package:flutter/material.dart';

class UserInfoPage extends StatefulWidget {
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: const Text("UserInfoPage"),
        ),
      );
  }

}