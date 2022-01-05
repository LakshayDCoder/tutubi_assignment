import 'package:flutter/material.dart';
import 'package:tutubi_assignment/screens/screen1.dart';
import 'package:tutubi_assignment/screens/screen2.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = "/splash-screen";

  Widget myBtn(String text, Function myOnTap) {
    return ElevatedButton(onPressed: () => myOnTap(), child: Text(text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutubi Assignment"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            myBtn("Screen 1", () {
              Navigator.pushNamed(context, Screen1.routeName);
            }),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                myBtn("Screen 2", () {
                  Navigator.pushNamed(context, Screen2.routeName);
                }),
                const Text(
                  "This screen will be an \ninfinite scroll.",
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
