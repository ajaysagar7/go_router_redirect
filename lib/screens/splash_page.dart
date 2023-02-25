import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5))
        .then((value) => context.go("/dashboard"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Splash Screen")),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "https://cdn.freebiesupply.com/logos/large/2x/splash-2-logo-png-transparent.png",
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            )
                .animate()
                .scale(
                    curve: Curves.easeIn,
                    // delay: Duration(seconds: 1),
                    alignment: Alignment.bottomCenter,
                    duration: Duration(seconds: 2))
                .then(delay: 600.ms)
                .shimmer(
                  color: Colors.grey.shade100,
                  curve: Curves.ease,
                  duration: Duration(seconds: 3),
                ),
          ],
        )),
      ),
    );
  }
}
