import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile page"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FlutterLogo(),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {
                context.go("/home");
              },
              child: Text("Navigate to Home Screen")),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                await preferences.remove("token");
                String? token = preferences.getString("token");
                log(token.toString());
              },
              child: const Text("Delete Token")),
        ],
      )),
    );
  }
}
