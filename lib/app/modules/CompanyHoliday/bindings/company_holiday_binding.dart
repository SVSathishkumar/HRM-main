import 'package:get/get.dart';

import '../controllers/company_holiday_controller.dart';

class CompanyHolidayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanyHolidayController>(
      () => CompanyHolidayController(),
    );
  }
}
