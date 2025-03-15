import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeDetailsController extends GetxController {
 var isEditing = false.obs;

  // Personal details
  var firstName = "Greeshma".obs;
  var lastName = "G".obs;
  var fatherName = "Babu Satheesa Chandran Nair".obs;
  var phoneNumber = "8606519237".obs;
  var emergencyContact = "9488166735".obs;
  var email = "greeshmaresmi@gmail.com".obs;
  var maritalStatus = "NA".obs;
  var designation = "Senior Software Developer".obs;
  var role = "Super Admin".obs;
  var joiningDate = "08-Mar-2021".obs;
  var relievingDate = "14-Aug-2024".obs;

  // KYC Details
  var aadhaar = "312509907483".obs;
  var pan = "N/A".obs;
  var passport = "NA".obs;
  var npsAccount = "NA".obs;
  var pfAccount = "NA".obs;
  var uploadedDocs = "NA".obs;

  // Employment Details
  var selectedDesignation = "Senior Software Developer".obs;
  var selectedRole = "Super Admin".obs;
  var isRelieved = false.obs;
  var employeeId = "EMP001".obs;

  // Controllers for date picking
  TextEditingController joiningDateController = TextEditingController();
  TextEditingController relievingDateController = TextEditingController();
  
  // Dropdown values
  List<String> designations = ["Senior Software Developer", "Software Engineer", "HR"];
  List<String> roles = ["Super Admin", "Employee", "Manager"];

  // Function to toggle edit mode
  void toggleEdit() {
    isEditing.value = !isEditing.value;
  }

  // Function to pick a date
  Future<void> pickDate(BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      controller.text = "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
    }
  }
}