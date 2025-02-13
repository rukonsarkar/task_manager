import 'package:get/get.dart';
import '../data/services/network_caller.dart';
import '../data/utils/urls.dart';
import 'package:flutter/material.dart';

class TaskController extends GetxController {
  final _tasks = <Map<String, dynamic>>[].obs;
  final _isLoading = false.obs;

  List<Map<String, dynamic>> get tasks => _tasks;
  bool get isLoading => _isLoading.value;

  Future<void> getAllTasks() async {
    _isLoading.value = true;
    final response = await NetworkCaller.getRequest(url: Urls.getAllTask);
    _isLoading.value = false;

    if (response.isSuccess) {
      _tasks.value = List<Map<String, dynamic>>.from(response.responseData['data']);
    } else {
      Get.snackbar(
        'Error',
        'Failed to load tasks',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red,
      );
    }
  }

  Future<void> updateTaskStatus(String taskId, String status) async {
    _isLoading.value = true;
    final response = await NetworkCaller.getRequest(
      url: Urls.updateTaskStatus(taskId, status),
    );
    _isLoading.value = false;

    if (response.isSuccess) {
      int index = _tasks.indexWhere((task) => task['_id'] == taskId);
      if (index != -1) {
        _tasks[index]['status'] = status;
        _tasks.refresh();
      }
      Get.snackbar(
        'Success',
        'Task status updated',
        backgroundColor: Colors.green.shade100,
        colorText: Colors.green,
      );
    } else {
      Get.snackbar(
        'Error',
        'Failed to update task status',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red,
      );
    }
  }

  Future<void> deleteTask(String taskId) async {
    _isLoading.value = true;
    final response = await NetworkCaller.getRequest(
      url: Urls.deleteTask(taskId),
    );
    _isLoading.value = false;

    if (response.isSuccess) {
      _tasks.removeWhere((task) => task['_id'] == taskId);
      Get.snackbar(
        'Success',
        'Task deleted successfully',
        backgroundColor: Colors.green.shade100,
        colorText: Colors.green,
      );
    } else {
      Get.snackbar(
        'Error',
        'Failed to delete task',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red,
      );
    }
  }
} 