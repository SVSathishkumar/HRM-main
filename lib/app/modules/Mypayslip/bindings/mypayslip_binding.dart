import 'package:get/get.dart';

import '../controllers/mypayslip_controller.dart';

class MypayslipBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MypayslipController>(
      () => MypayslipController(),
    );
  }
}
