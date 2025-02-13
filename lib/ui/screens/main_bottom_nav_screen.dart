import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/progress_task_list_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:get/get.dart';

import 'canceled_task_list_screen.dart';
import 'completed_task_list_screen.dart';
import 'new_task_list_screen.dart';
import 'package:task_manager/routes/app_routes.dart';
import 'package:task_manager/controllers/navigation_controller.dart';

class MainBottomNavScreen extends GetView<NavigationController> {
  const MainBottomNavScreen({super.key});

  static String name = '/home';

  final List<Widget> _screens = const [
    NewTaskListScreen(),
    CompletedTaskListScreen(),
    CanceledTaskListScreen(),
    ProgressTaskListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    
    return Scaffold(
      body: Obx(() => _screens[controller.selectedIndex]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: controller.selectedIndex,
        selectedItemColor: AppColors.themColor,
        onTap: controller.changeIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_task), label: 'New Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.task_alt_rounded), label: 'Completed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.cancel_outlined), label: 'Canceled'),
          BottomNavigationBarItem(
              icon: Icon(Icons.label_important_outline), label: 'Progress'),
        ],
      )),
    );
  }
}
