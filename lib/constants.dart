import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF446940);
const kPrimaryLightColor = Color(0xFF98e890);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF98e890), Color(0xFF446940)],
);
const kSecondaryColor = Color(0xFF000000);
const kTextColor = Color(0xFF000000);

const kErrorColor = Color(0xffa83832);

const kAnimationDuration = Duration(milliseconds: 200);

const headingStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

enum SnackbarTypes { Normal, Success, Fail }

showMySnackbar({
  required BuildContext ctx,
  required String text,
  SnackbarTypes type = SnackbarTypes.Normal,
  Duration duration = const Duration(seconds: 3),
}) {
  ScaffoldMessenger.of(ctx).removeCurrentSnackBar();

  SnackBar mySnack = SnackBar(
    duration: duration,
    content: Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.7,
      ),
    ),
  );

  if (type == SnackbarTypes.Success) {
    mySnack = SnackBar(
      duration: duration,
      content: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.7,
        ),
      ),
      backgroundColor: kPrimaryColor,
    );
  }

  if (type == SnackbarTypes.Fail) {
    mySnack = SnackBar(
      duration: duration,
      content: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.7,
        ),
      ),
      backgroundColor: kErrorColor,
    );
  }

  ScaffoldMessenger.of(ctx).showSnackBar(mySnack);
}
