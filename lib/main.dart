import 'package:eshopping/screen/login.dart';
import 'package:eshopping/screen/register.dart';
import 'package:eshopping/screen/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    ),
  );
}
