import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Example'),
      ),
      body: Center(
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter: ${controller.counter}',
              style: TextStyle(fontSize: 24),
            ),
            if (controller.isLoading)
              CircularProgressIndicator(),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
} 