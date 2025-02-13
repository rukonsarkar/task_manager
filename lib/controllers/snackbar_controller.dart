import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarController extends GetxController {
  static void showSuccess(String message) {
    Get.snackbar(
      'Success',
      message,
      backgroundColor: Colors.green.shade100,
      colorText: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
    );
  }

  static void showError(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red.shade100,
      colorText: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
    );
  }

  static void showInfo(String message) {
    Get.snackbar(
      'Info',
      message,
      backgroundColor: Colors.blue.shade100,
      colorText: Colors.blue,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
    );
  }
} 