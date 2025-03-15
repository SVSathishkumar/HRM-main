import 'package:get/get.dart';

import '../controllers/logsheet_controller.dart';

class LogsheetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogsheetController>(
      () => LogsheetController(),
    );
  }
}
