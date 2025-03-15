import 'package:get/get.dart';

class MypayslipController extends GetxController {
  //TODO: Implement MypayslipController
    var selectedPayrollMonth = 'Please Select'.obs;
  List<String> payrollMonths = ['Please Select', 'Jan', 'Feb', 'Mar', 'Apr'];
  var showSalaryTable = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
