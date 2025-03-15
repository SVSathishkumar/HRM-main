import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

class LogoutPopup {
  static void show() {
    final context = Get.context!;

    QuickAlert.show(
      confirmBtnColor:Color(0xFFDF0238),
      title: "Are you sure you want to log out?",
      context: context,
      type: QuickAlertType.error, // Changed to 'warning' type
      barrierDismissible: true,
      showConfirmBtn: true,
      showCancelBtn: true,
      confirmBtnText: "Yes",
      cancelBtnText: "No",
      onConfirmBtnTap: () {
        // Call your logout function here
        // For example: controller.logout();
        Get.back(); // Close the popup after logout
      },
      onCancelBtnTap: () {
        Get.back(); // Close the popup without logging out
      },
    );
  }
}
