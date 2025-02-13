import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/task_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(TaskController(), permanent: true);
  }
} 