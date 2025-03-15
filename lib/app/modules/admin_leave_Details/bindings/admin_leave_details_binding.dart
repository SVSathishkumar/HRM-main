import 'package:get/get.dart';

import '../controllers/admin_leave_details_controller.dart';

class AdminLeaveDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminLeaveDetailsController>(
      () => AdminLeaveDetailsController(),
    );
  }
}
