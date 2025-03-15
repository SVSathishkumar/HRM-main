import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';

import '../../modules/Calender/controllers/calender_controller.dart';
import '../../utils/themes.dart';

class AddEventPopup {
  static void show(CalenderController controller) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController eventController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    final context = Get.context!;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    QuickAlert.show(
      context: context,
      type: QuickAlertType.custom,
      barrierDismissible: true,
      customAsset: "assets/images/EventEdit.jpg",
      showConfirmBtn: false,
      widget: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          // Add SingleChildScrollView here
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: screenHeight * 0.02),
              TextFormField(
                controller: eventController,
                decoration: InputDecoration(
                  hintText: "Enter event Name",
                  hintStyle: GoogleFonts.teko(
                    fontSize: screenWidth * 0.04,
                    color: Colors.grey,
                  ),
                  border: const OutlineInputBorder(),
                  errorStyle: GoogleFonts.teko(
                    color: Colors.red,
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Event name is required *";
                  }
                  return null;
                },
                style: GoogleFonts.teko(
                  fontSize: screenWidth * 0.04,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: "Event Description",
                  hintStyle: GoogleFonts.teko(
                    fontSize: screenWidth * 0.04,
                    color: Colors.grey,
                  ),
                  border: const OutlineInputBorder(),
                  errorStyle: GoogleFonts.teko(
                    color: Colors.red,
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Event description is required *";
                  }
                  return null;
                },
                style: GoogleFonts.teko(
                  fontSize: screenWidth * 0.04,
                  color: Colors.black,
                ),
                maxLines: 2,
                keyboardType: TextInputType.multiline,
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                        vertical: screenHeight * 0.015,
                      ),
                      textStyle: GoogleFonts.teko(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                      shadowColor: Colors.black.withOpacity(0.3),
                      elevation: 5,
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: ThemeClass.lightPrimaryColor),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        controller.addEvent(
                          eventController.text,
                          descriptionController.text,
                        );
                        Get.back();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeClass.lightPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                        vertical: screenHeight * 0.015,
                      ),
                      textStyle: GoogleFonts.teko(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
