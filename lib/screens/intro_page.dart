import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Intro Screen")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const FlutterLogo(
            size: 300,
            style: FlutterLogoStyle.stacked,
          ).animate().shimmer(duration: Duration(seconds: 3)),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
                pref
                    .setString("onboardToken", "onboardToken")
                    .then((value) => context.go("/login"));
              },
              child: const Text("Navigate with token Onboard Screen")),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                context.go("/login");
              },
              child: const Text("Navigate to Login Screen")),
        ],
      )),
    ));
  }
}
