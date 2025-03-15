// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm/app/utils/themes.dart';
import '../controllers/company_holiday_controller.dart';

class CompanyHolidayView extends GetView<CompanyHolidayController> {
  const CompanyHolidayView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure the controller is initialized
    final CompanyHolidayController controller = Get.put(
      CompanyHolidayController(),
    );

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: ThemeClass.lightPrimaryColor,
        title: Text(
          'LEAVE MANAGEMENT',
          style: GoogleFonts.teko(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Add Yearly Holidays',
                  style: GoogleFonts.teko(
                    fontSize: 16,
                    color: ThemeClass.lightPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: SizedBox(
                  width: 100,
                  child: Divider(
                    color: ThemeClass.lightPrimaryColor,
                    thickness: 2,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Annual Leave Days",
                          style: GoogleFonts.teko(
                            fontSize: 18,
                            color: ThemeClass.lightPrimaryColor,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: controller.refreshRows,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            backgroundColor: Colors.green,
                          ),
                          child: Text(
                            "Refresh",
                            style: GoogleFonts.teko(
                              color: ThemeClass.secondaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    // Leave Days List
                    Obx(
                      () => Column(
                        children: List.generate(controller.leaveDays.length, (
                          index,
                        ) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Date Field
                                TextField(
                                  controller: TextEditingController(
                                      text: controller.leaveDays[index]["date"],
                                    )
                                    ..selection = TextSelection.fromPosition(
                                      TextPosition(
                                        offset:
                                            controller
                                                .leaveDays[index]["date"]!
                                                .length,
                                      ),
                                    ),
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    errorStyle: GoogleFonts.teko(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    labelStyle: GoogleFonts.teko(
                                      color: Colors.grey,
                                    ),
                                    labelText: "Date",
                                    errorText: controller.validateDate(index),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.calendar_today),
                                      onPressed:
                                          () => controller.selectDate(
                                            context,
                                            index,
                                          ),
                                    ),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 10),

                                // Festival/Holiday Reason Field
                                TextField(
                                  onChanged: (value) {
                                    controller.leaveDays[index]["festival"] =
                                        value;
                                    controller.leaveDays.refresh();
                                  },
                                  decoration: InputDecoration(
                                    errorStyle: GoogleFonts.teko(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    labelStyle: GoogleFonts.teko(
                                      color: Colors.grey,
                                    ),
                                    labelText: "Festival/Holiday Reason",
                                    errorText: controller.validateFestival(
                                      index,
                                    ),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 10),

                                // Add/Delete Button
                                SizedBox(
                                  width:
                                      double
                                          .infinity, // Makes the button take full width
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(),
                                      backgroundColor:
                                          index == 0
                                              ? Colors.green
                                              : Colors.red,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 12,
                                      ), // Adds some height for better UI
                                    ),
                                    onPressed:
                                        index == 0
                                            ? controller.addRow
                                            : () => controller.removeRow(index),
                                    icon: Icon(
                                      index == 0 ? Icons.add : Icons.delete,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    label: Text(
                                      index == 0 ? "Add" : "Delete",
                                      style: GoogleFonts.teko(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),

                                Divider(),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 10),

                    // ADD & Submit Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: controller.addFourRows,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            backgroundColor: Colors.green,
                          ),
                          child: Text(
                            "Add 4 Rows",
                            style: GoogleFonts.teko(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (controller.validateForm()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Leave submitted successfully!",
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Please fill all required fields",
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            backgroundColor: ThemeClass.lightPrimaryColor,
                          ),
                          child: Text(
                            "Submit",
                            style: GoogleFonts.teko(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Yearly Holidays Listing",
                      style: GoogleFonts.teko(
                        color: ThemeClass.lightPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Year",
                      style: GoogleFonts.teko(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Obx(
                      () => DropdownButtonFormField<String>(
                        style: GoogleFonts.teko(
                          color: ThemeClass.accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                        value: controller.selectedYear.value,
                        items:
                            ["2025", "2024", "2023", "2022", "2021"].map((
                              String year,
                            ) {
                              return DropdownMenuItem<String>(
                                value: year,
                                child: Text(year),
                              );
                            }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            controller.selectedYear.value = value;
                          }
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Obx(
                      () => Table(
                        columnWidths: {
                          0: FixedColumnWidth(50), // "NO" Column
                          1: FixedColumnWidth(100), // "DATE" Column
                          2: FlexColumnWidth(
                            2,
                          ), // "FESTIVAL/HOLIDAY" Column (Flexible width)
                          3: FixedColumnWidth(100), // "ACTION" Column
                        },
                        border: TableBorder.all(color: Colors.grey[400]!),
                        children: [
                          // Table Header
                          TableRow(
                            decoration: BoxDecoration(
                              color: ThemeClass.lightPrimaryColor,
                            ),
                            children: [
                              tableHeaderCell("NO"),
                              tableHeaderCell("DATE"),
                              tableHeaderCell("FESTIVAL/HOLIDAY"),
                              tableHeaderCell("ACTION"),
                            ],
                          ),
                          // Table Rows
                          ...List.generate(controller.holidays.length, (index) {
                            return TableRow(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                              ),
                              children: [
                                tableCell("${index + 1}"),
                                tableCell(controller.holidays[index]["date"]!),
                                tableCell(
                                  controller.holidays[index]["festival"]!,
                                ),
                                actionCell(index),
                              ],
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widgets
  Widget tableHeaderCell(String text) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        text,
        style: GoogleFonts.teko(
          color: ThemeClass.secondaryColor,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget tableCell(String text) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.teko(
          color: ThemeClass.accentColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget actionCell(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Edit Button
          GestureDetector(
            onTap: () => controller.editHoliday(index),
            child: Tooltip(
              message: 'Edit',
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Icon(Icons.edit, size: 20, color: Colors.blue),
              ),
            ),
          ),
          const SizedBox(width: 5),

          // Delete Button
          GestureDetector(
            onTap: () => controller.deleteHoliday(index),
            child: Tooltip(
              message: 'Delete',
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Icon(Icons.delete, size: 20, color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
