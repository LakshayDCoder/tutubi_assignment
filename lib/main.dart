import 'package:flutter/material.dart';
import 'package:tutubi_assignment/routes.dart';
import 'package:tutubi_assignment/screens/screen2.dart';
import 'package:tutubi_assignment/screens/splash_screen.dart';
import 'package:tutubi_assignment/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      routes: routes,
      initialRoute: SplashScreen.routeName,
      // initialRoute: Screen2.routeName,
    );
  }
}
