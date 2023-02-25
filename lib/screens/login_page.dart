import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 250,
                  width: 250,
                  child: const FlutterLogo()
                      .animate()
                      // .slide(
                      //   curve: Curves.easeIn,
                      //   duration: Duration(milliseconds: 300),
                      // )
                      .scale(
                          alignment: Alignment.bottomCenter,
                          begin: Offset(0, 0),
                          end: Offset(1, 1),
                          duration: Duration(milliseconds: 600))
                      .shake(
                          duration: Duration(milliseconds: 800),
                          curve: Curves.bounceIn)
                      .shimmer(
                        color: Colors.blueAccent,
                        duration: Duration(seconds: 3),
                      )),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                      onPressed: () {
                        context.go("/profile");
                      },
                      child: const Text("Login to Profile"))
                  .animate()
                  .shimmer(
                      duration: const Duration(
                        milliseconds: 600,
                      ),
                      color: Colors.blueAccent),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    preferences.setString("token", "1234567890");
                  },
                  child: const Text("Save Token")),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    String? token = preferences.getString("token");
                    log(token.toString());
                  },
                  child: const Text("Get token")),
              ElevatedButton(
                  onPressed: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    await preferences.remove("token");
                    await preferences.remove("onboardToken");
                    String? token = preferences.getString("token");
                    String? onboardTOken =
                        preferences.getString("onboardToken");
                    log(token.toString());
                    log(onboardTOken.toString());
                  },
                  child: const Text("Delete Token")),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.go("/home");
                  },
                  child: const Text("Login with HomePage"))
            ],
          ),
        ),
      ),
    );
  }
}
