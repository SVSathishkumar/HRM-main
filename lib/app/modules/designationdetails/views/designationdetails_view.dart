import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Widgets/FloationgActionWidget.dart';
import '../../../utils/themes.dart';
import '../controllers/designationdetails_controller.dart';

class DesignationdetailsView extends GetView<DesignationdetailsController> {
  const DesignationdetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ThemeClass.secondaryColor),
        backgroundColor: ThemeClass.lightPrimaryColor,
        title: Text(
          'Designation Details',
          style: GoogleFonts.teko(
            color: ThemeClass.secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Card(
            elevation: 02,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: Text(
                    'DESIGNATION DETAILS :',
                    style: GoogleFonts.teko(
                      color: ThemeClass.accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize:
                          screenWidth *
                          0.05, // Adjust font size based on screen width
                    ),
                  ),
                ),
                Divider(),
                SizedBox(height: 10),
                exactTable(screenWidth), // Pass the screen width to exactTable
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: const FloatingActionWidget(),
    );
  }
}

Widget exactTable(double screenWidth) {
  return Table(
    border: TableBorder.all(color: Colors.grey[400]!),
    columnWidths: {
      0: FixedColumnWidth(screenWidth * 0.1), // Adjust based on screen width
      1: FlexColumnWidth(),
      2: FixedColumnWidth(screenWidth * 0.2), // Adjust based on screen width
      3: FlexColumnWidth(),
      4: FlexColumnWidth(),
    },
    children: [
      TableRow(
        decoration: BoxDecoration(color: ThemeClass.lightPrimaryColor),
        children: [
          tableCell("NO", isHeader: true),
          tableCell("DEPARTMENT", isHeader: true),
          tableCell("CARRIER LEVEL", isHeader: true),
          tableCell("DESIGNATION", isHeader: true),
          tableCell("ACTION", isHeader: true),
        ],
      ),
      TableRow(
        decoration: BoxDecoration(color: Colors.grey[200]),
        children: [
          tableCell("1"),
          tableCell("HR"),
          tableCell("Junior"),
          tableCell("HR Manager"),
          actionCell(),
        ],
      ),
      TableRow(
        children: [
          tableCell("2"),
          tableCell("IT"),
          tableCell("Mid"),
          tableCell("Software Engineer"),
          actionCell(),
        ],
      ),
      TableRow(
        decoration: BoxDecoration(color: Colors.grey[200]),
        children: [
          tableCell("3"),
          tableCell("Finance"),
          tableCell("Senior"),
          tableCell("Finance Analyst"),
          actionCell(),
        ],
      ),
      TableRow(
        decoration: BoxDecoration(color: Colors.grey[200]),
        children: [
          tableCell("4"),
          tableCell("HR"),
          tableCell("Junior"),
          tableCell("HR Assistant"),
          actionCell(),
        ],
      ),
      TableRow(
        children: [
          tableCell("5"),
          tableCell("IT"),
          tableCell("Mid"),
          tableCell("Frontend Developer"),
          actionCell(),
        ],
      ),
      TableRow(
        decoration: BoxDecoration(color: Colors.grey[200]),
        children: [
          tableCell("6"),
          tableCell("Finance"),
          tableCell("Senior"),
          tableCell("Finance Director"),
          actionCell(),
        ],
      ),
      TableRow(
        decoration: BoxDecoration(color: Colors.grey[200]),
        children: [
          tableCell("7"),
          tableCell("Marketing"),
          tableCell("Junior"),
          tableCell("Marketing Executive"),
          actionCell(),
        ],
      ),
      TableRow(
        children: [
          tableCell("8"),
          tableCell("Sales"),
          tableCell("Mid"),
          tableCell("Sales Manager"),
          actionCell(),
        ],
      ),
      TableRow(
        decoration: BoxDecoration(color: Colors.grey[200]),
        children: [
          tableCell("9"),
          tableCell("Support"),
          tableCell("Senior"),
          tableCell("Support Lead"),
          actionCell(),
        ],
      ),
      TableRow(
        decoration: BoxDecoration(color: Colors.grey[200]),
        children: [
          tableCell("10"),
          tableCell("Admin"),
          tableCell("Junior"),
          tableCell("Admin Executive"),
          actionCell(),
        ],
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
    padding: const EdgeInsets.all(4.0),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            print("Edit tapped");
          },
          child: Tooltip(
            message: 'Edit',
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: const Icon(Icons.edit, size: 16, color: Colors.blue),
            ),
          ),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: () {
            print("Visibility tapped");
          },
          child: Tooltip(
            message: 'Visibility',
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: const Icon(
                Icons.visibility,
                size: 16,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
