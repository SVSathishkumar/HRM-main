import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm/app/utils/themes.dart';
import '../controllers/logsheet_controller.dart';

// ignore: use_key_in_widget_constructors
class LogsheetView extends GetView<LogsheetController> {
  final LogsheetController controller = Get.put(LogsheetController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ThemeClass.secondaryColor),
        backgroundColor: ThemeClass.lightPrimaryColor,
        title: Text(
          'LOGSHEET',
          style: GoogleFonts.teko(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Employee Management',
                style: GoogleFonts.teko(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ThemeClass.lightPrimaryColor,
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'WEEKLY REPORT [Feb-15-25  TO  Feb-20-25]',
                style: GoogleFonts.teko(
                  fontSize: 16,
                  color: ThemeClass.lightPrimaryColor,
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: 100,
                child: Divider(
                  color: ThemeClass.lightPrimaryColor,
                  thickness: 2,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "WEEKLY REPORT",
              style: GoogleFonts.teko(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ThemeClass.lightPrimaryColor,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Start Date Picker
                  Text(
                    "Start Date",
                    style: GoogleFonts.teko(
                      fontWeight: FontWeight.bold,
                      color: ThemeClass.accentColor,
                    ),
                  ),
                  SizedBox(height: 4),
                  Obx(
                    () => TextFormField(
                      readOnly: true,
                      controller: TextEditingController(
                        text: controller.startDate.value,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () => controller.selectDate(context, true),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // End Date Picker
                  Text(
                    "End Date",
                    style: GoogleFonts.teko(
                      fontWeight: FontWeight.bold,
                      color: ThemeClass.accentColor,
                    ),
                  ),
                  SizedBox(height: 4),
                  Obx(
                    () => TextFormField(
                      readOnly: true,
                      controller: TextEditingController(
                        text: controller.endDate.value,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed:
                              () => controller.selectDate(context, false),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Choose Employee
                  Text(
                    "Choose Employee",
                    style: GoogleFonts.teko(
                      fontWeight: FontWeight.bold,
                      color: ThemeClass.accentColor,
                    ),
                  ),
                  SizedBox(height: 4),
                  Obx(
                    () => DropdownButtonFormField<String>(
                      style: GoogleFonts.teko(
                        fontWeight: FontWeight.bold,
                        color: ThemeClass.accentColor,
                      ),
                      value: controller.selectedEmployee.value,
                      items:
                          [
                            "Mariselvam",
                            "Yesu Balan",
                            "Aravind",
                            "Sathish",
                            "Saji",
                            "Sneha",
                          ].map((String employee) {
                            return DropdownMenuItem<String>(
                              value: employee,
                              child: Text(employee),
                            );
                          }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedEmployee.value = value;
                        }
                      },
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
