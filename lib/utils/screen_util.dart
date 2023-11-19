// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ScreenUtil {
  static void CustomSystemChrome(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Get.theme.colorScheme.background,
      systemNavigationBarColor: Get.theme.colorScheme.background,
      statusBarIconBrightness: Get.theme.colorScheme.brightness,
      systemNavigationBarIconBrightness: Get.theme.colorScheme.brightness,// For Android
      //statusBarBrightness: Brightness.dark, // For iOS
    ));
  }
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
