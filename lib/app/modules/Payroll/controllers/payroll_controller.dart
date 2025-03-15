import 'package:get/get.dart';

class PayrollController extends GetxController {
  var selectedCareerLevel = RxnString();
  final count = 0.obs;

  // Add career levels to the controller
  final List<String> careerLevels = [
    'Career Level 1',
    'Career Level 2',
    'Career Level 3',
    'Career Level 4',
    'Career Level 5',
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
