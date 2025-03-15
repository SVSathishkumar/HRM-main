import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LogsheetController extends GetxController {
  var startDate = "".obs;
  var endDate = "".obs;
  var selectedEmployee = "Mariselvam".obs;

  Future<void> selectDate(BuildContext context, bool isStartDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      if (isStartDate) {
        startDate.value = formattedDate;
      } else {
        endDate.value = formattedDate;
      }
    }
  }
}