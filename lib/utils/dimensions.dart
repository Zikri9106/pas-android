import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = 0.0;
  static double screenWidth = 0.0;

  static double pageView = 0.0;
  static double pageViewContainer = 0.0;
  static double pageViewTextContainer = 0.0;

  // dynamic height padding and margin
  static double height10 = 0.0;
  static double height15 = 0.0;
  static double height20 = 0.0;
  static double height30 = 0.0;
  static double height40 = 0.0;

  // dynamic width padding and margin
  static double width10 = 0.0;
  static double width15 = 0.0;
  static double width20 = 0.0;
  static double width30 = 0.0;

  static double font20 = 0.0;

  // radius
  static double radius15 = 0.0;
  static double radius20 = 0.0;
  static double radius30 = 0.0;

  // icon size
  static double iconSize24 = 0.0;

  // list view size
  static double listViewImgSize = 0.0;
  static double listViewTextContSize = 0.0;

  static void initializeDimensions(BuildContext context) {
    screenHeight = context.height;
    screenWidth = context.width;

    pageView = screenHeight / 2.64;
    pageViewContainer = screenHeight / 3.84;
    pageViewTextContainer = screenHeight / 7.03;

    height10 = screenHeight / 84.4;
    height15 = screenHeight / 56.27;
    height20 = screenHeight / 42.2;
    height30 = screenHeight / 28.13;
    height40 = screenHeight / 18.76;

    width10 = screenHeight / 84.4;
    width15 = screenHeight / 56.27;
    width20 = screenHeight / 42.2;
    width30 = screenHeight / 28.13;

    font20 = screenHeight / 42.2;

    radius15 = screenHeight / 56.27;
    radius20 = screenHeight / 42.2;
    radius30 = screenHeight / 28.13;

    iconSize24 = screenHeight / 35.17;

    listViewImgSize = screenWidth / 3.52;
    listViewTextContSize = screenWidth / 3.9;
  }
}
