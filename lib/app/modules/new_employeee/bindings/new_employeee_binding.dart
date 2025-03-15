import 'package:get/get.dart';

import '../controllers/new_employeee_controller.dart';

class NewEmployeeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewEmployeeeController>(
      () => NewEmployeeeController(),
    );
  }
}
