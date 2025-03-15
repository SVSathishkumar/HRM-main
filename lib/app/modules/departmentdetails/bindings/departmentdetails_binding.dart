import 'package:get/get.dart';

import '../controllers/departmentdetails_controller.dart';

class DepartmentdetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DepartmentdetailsController>(
      () => DepartmentdetailsController(),
    );
  }
}
