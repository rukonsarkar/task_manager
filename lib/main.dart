import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_manager/app.dart';
import 'package:task_manager/controllers/auth_controller.dart';
import 'package:task_manager/controllers/navigation_controller.dart';
import 'package:task_manager/controllers/task_controller.dart';

void main() {
  Get.put(AuthController(), permanent: true);
  Get.put(NavigationController());
  Get.put(TaskController());
  
  runApp(TaskManagerApp());
}
