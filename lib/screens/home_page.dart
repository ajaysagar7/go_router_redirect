import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
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
                context.go("/profile");
              },
              child: Text("Navigate to Profile Page")),
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
