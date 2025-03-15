import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/themes.dart';

class AddLeavebyadminpopup extends StatelessWidget {
  AddLeavebyadminpopup({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController allottedHolidaysController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Add Leave Form",
                style: GoogleFonts.teko(
                  color: ThemeClass.lightPrimaryColor,
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.03),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
              },
              children: [
                _buildTableRow(
                  "Position",
                  TextFormField(
                    style: GoogleFonts.teko(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      errorStyle: GoogleFonts.teko(
                        color: Colors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a position*";
                      }
                      return null;
                    },
                  ),
                ),
                _buildTableRow(
                  "Department",
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      errorStyle: GoogleFonts.teko(
                        color: Colors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    items:
                        ["HR", "IT", "Finance", "Marketing"].map((
                          String department,
                        ) {
                          return DropdownMenuItem<String>(
                            value: department,
                            child: Text(department),
                          );
                        }).toList(),
                    onChanged: (String? value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please select a department*";
                      }
                      return null;
                    },
                  ),
                ),
                _buildTableRow(
                  "Carrier Level",
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      errorStyle: GoogleFonts.teko(
                        color: Colors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    items:
                        ["Junior", "Mid-Level", "Senior", "Manager"].map((
                          String level,
                        ) {
                          return DropdownMenuItem<String>(
                            value: level,
                            child: Text(level),
                          );
                        }).toList(),
                    onChanged: (String? value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please select a carrier level*";
                      }
                      return null;
                    },
                  ),
                ),
                _buildTableRow(
                  "Allotted Holidays",
                  TextFormField(
                    controller: allottedHolidaysController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      errorStyle: GoogleFonts.teko(
                        color: Colors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter allotted holidays*";
                      }
                      if (int.tryParse(value) == null) {
                        return "Please enter a valid number";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: screenWidth * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: screenWidth * 0.3, // Responsive button width
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[600],
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.teko(
                          color: ThemeClass.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeClass.lightPrimaryColor,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.snackbar(
                          "Success",
                          "Form submitted successfully!",
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Text(
                        "Submit",
                        style: GoogleFonts.teko(
                          color: ThemeClass.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, Widget field) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            label,
            style: GoogleFonts.teko(
              color: ThemeClass.accentColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: field,
        ),
      ],
    );
  }
}
