import 'package:get/get.dart';

import '../controllers/carrierleveldetails_controller.dart';

class CarrierleveldetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarrierleveldetailsController>(
      () => CarrierleveldetailsController(),
    );
  }
}
