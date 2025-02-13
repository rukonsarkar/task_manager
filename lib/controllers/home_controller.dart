import 'package:get/get.dart';
import 'base_controller.dart';

class HomeController extends BaseController {
  final _counter = 0.obs;
  
  int get counter => _counter.value;
  
  void increment() {
    _counter.value++;
  }
} 