import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm/app/modules/EmployeeDetails/views/employee_details_view.dart';
import '../../../Widgets/FloationgActionWidget.dart';
import '../../../utils/themes.dart';
import '../controllers/departmentdetails_controller.dart';

class DepartmentdetailsView extends GetView<DepartmentdetailsController> {
  const DepartmentdetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ThemeClass.secondaryColor),
        backgroundColor: ThemeClass.lightPrimaryColor,
        title: Text(
          'Department Details',
          style: GoogleFonts.teko(
            color: ThemeClass.secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.06, // Responsive title font size
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        // Added SingleChildScrollView here
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
          child: exactTable(screenWidth),
        ),
      ),
      floatingActionButton: const FloatingActionWidget(),
    );
  }

  Widget exactTable(double screenWidth) {
    return Table(
      border: TableBorder.all(color: Colors.grey[400]!),
      columnWidths: {
        0: FixedColumnWidth(screenWidth * 0.1), // Responsive column width
        1: FlexColumnWidth(),
        2: FixedColumnWidth(screenWidth * 0.3), // Responsive column width
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: ThemeClass.lightPrimaryColor),
          children: [
            tableCell("NO", isHeader: true),
            tableCell("DEPARTMENT", isHeader: true),
            tableCell("ACTION", isHeader: true),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[200]),
          children: [tableCell("1"), tableCell("HR"), actionCell()],
        ),
        TableRow(children: [tableCell("2"), tableCell("IT"), actionCell()]),
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[200]),
          children: [tableCell("3"), tableCell("Finance"), actionCell()],
        ),
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[200]),
          children: [tableCell("4"), tableCell("HR"), actionCell()],
        ),
        TableRow(children: [tableCell("5"), tableCell("IT"), actionCell()]),
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[200]),
          children: [tableCell("6"), tableCell("Finance"), actionCell()],
        ),
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[200]),
          children: [tableCell("7"), tableCell("Marketing"), actionCell()],
        ),
        TableRow(children: [tableCell("8"), tableCell("Sales"), actionCell()]),
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[200]),
          children: [tableCell("9"), tableCell("Support"), actionCell()],
        ),
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[200]),
          children: [tableCell("10"), tableCell("Admin"), actionCell()],
        ),
      ],
    );
  }

  Widget tableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: GoogleFonts.teko(
          fontSize: 16,
          color: isHeader ? Colors.white : Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget actionCell() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // Handle edit action
              print("Edit tapped");
            },
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
          GestureDetector(
            onTap: () {
        
              // Handle visibility action
              print("Visibility tapped");
            },
            child: Tooltip(
              message: 'Visibility',
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.greenAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Icon(
                  Icons.visibility,
                  size: 20,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
