import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';

class TaskPage extends StatelessWidget {
  final TaskController controller = Get.put(TaskController());
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'Enter task',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (textController.text.isNotEmpty) {
                      controller.addTask(textController.text);
                      textController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(controller.tasks[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => controller.removeTask(index),
                  ),
                );
              },
            )),
          ),
        ],
      ),
    );
  }
} 