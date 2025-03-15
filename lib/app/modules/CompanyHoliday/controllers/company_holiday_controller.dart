import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyHolidayController extends GetxController {
  var selectedYear = "2024".obs;
   
   var leaveDays = <Map<String, String>>[{"date": "", "festival": ""}].obs;

  void addLeaveDay() {
    leaveDays.add({"date": "", "festival": ""});
  }

  void selectDate(BuildContext context, int index) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      leaveDays[index]["date"] = pickedDate.toString().split(" ")[0];
      leaveDays.refresh();
    }
  }

  // Validation Logic
  String? validateDate(int index) {
    if (leaveDays[index]["date"] == null || leaveDays[index]["date"]!.isEmpty) {
      return "Date is required";
    }
    return null;
  }

  String? validateFestival(int index) {
    if (leaveDays[index]["festival"] == null ||
        leaveDays[index]["festival"]!.isEmpty) {
      return "Festival/Holiday Reason is required";
    }
    return null;
  }

  // Final Validation Before Submission
  bool validateForm() {
    for (var i = 0; i < leaveDays.length; i++) {
      if (validateDate(i) != null || validateFestival(i) != null) {
        leaveDays.refresh(); // Refresh UI to show errors
        return false;
      }
    }
    return true;
  }

  void addRow() {
    leaveDays.add({"date": "", "festival": ""}); // ✅ Adds at the bottom
  }

  void addFourRows() {
    leaveDays.addAll(
      List.generate(4, (_) => {"date": "", "festival": ""}),
    ); // ✅ Adds 4 rows at the bottom
  }

  void removeRow(int index) {
    if (leaveDays.length > 1) {
      leaveDays.removeAt(index);
    }
  }

  void refreshRows() {
    leaveDays.assignAll([
      {"date": "", "festival": ""},
    ]);
  }

  // festivel
  var holidays =
      <Map<String, String>>[
        {"date": "13-02-2025", "festival": "Test Holiday"},
      ].obs;

  void deleteHoliday(int index) {
    holidays.removeAt(index);
  }

  void editHoliday(int index) {
    // Implement edit logic here
  }
}