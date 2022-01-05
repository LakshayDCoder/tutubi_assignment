import 'package:flutter/material.dart';
import 'package:tutubi_assignment/screens/screen1.dart';
import 'package:tutubi_assignment/screens/screen2.dart';
import 'package:tutubi_assignment/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (ctx) => const SplashScreen(),
  Screen1.routeName: (ctx) => const Screen1(),
  Screen2.routeName: (ctx) => const Screen2(),
};
