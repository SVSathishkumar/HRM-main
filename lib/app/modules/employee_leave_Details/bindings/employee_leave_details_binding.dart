import 'package:get/get.dart';

import '../controllers/employee_leave_details_controller.dart';

class EmployeeLeaveDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeLeaveDetailsController>(
      () => EmployeeLeaveDetailsController(),
    );
  }
}
