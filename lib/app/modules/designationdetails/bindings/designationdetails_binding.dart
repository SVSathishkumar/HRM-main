import 'package:get/get.dart';

import '../controllers/designationdetails_controller.dart';

class DesignationdetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DesignationdetailsController>(
      () => DesignationdetailsController(),
    );
  }
}
