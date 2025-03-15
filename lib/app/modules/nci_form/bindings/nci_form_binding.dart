import 'package:get/get.dart';

import '../controllers/nci_form_controller.dart';

class NciFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NciFormController>(
      () => NciFormController(),
    );
  }
}
