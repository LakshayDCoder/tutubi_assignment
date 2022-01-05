import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

double getPercentageScreenHeight(double inputPercentage) {
  double? screenHeight = SizeConfig.screenHeight;
  return screenHeight! * inputPercentage;
}

double getPercentageScreenWidth(double inputPercentage) {
  double? screenWidth = SizeConfig.screenWidth;
  return screenWidth! * inputPercentage;
}
