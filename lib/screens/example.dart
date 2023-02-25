import 'dart:developer';

import 'package:flutter_go_router/screens/home_page.dart';
import 'package:flutter_go_router/screens/intro_page.dart';
import 'package:flutter_go_router/screens/login_page.dart';
import 'package:flutter_go_router/screens/profile_page.dart';
import 'package:flutter_go_router/screens/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomGoRouter {
  final router = GoRouter(
      redirectLimit: 1000,
      initialLocation: "/",
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: "/",
          builder: ((context, state) => const SplashPage()),
        ),
        GoRoute(
          path: "/dashboard",
          builder: ((context, state) => const IntroScreen()),
          redirect: (context, state) async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            String? token = preferences.getString("onboardToken");
            if (token != null) {
              return "/login";
            } else {
              return null;
            }
          },
        ),
        GoRoute(
          path: "/login",
          builder: ((context, state) => const LoginPage()),
          redirect: (context, state) async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            String? token = preferences.getString("token");
            if (token != null) {
              return "/home";
            } else {
              return null;
            }
          },
        ),
        GoRoute(
          path: "/home",
          builder: ((context, state) => const HomePage()),
          redirect: (context, state) async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            String? token = preferences.getString("token");
            log("printing token in redirect function $token");
            if (token == null) {
              return "/login";
            } else {
              return null;
            }
          },
        ),
        GoRoute(
          path: "/profile",
          builder: ((context, state) => const ProfilePage()),
          redirect: (context, state) async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            String? token = preferences.getString("token");
            log("printing token in redirect function $token");
            if (token == null) {
              return "/login";
            } else {
              return null;
            }
          },
        ),
      ]);
}
