import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Widgets/FloationgActionWidget.dart';
import '../../../utils/themes.dart';
import '../controllers/carrierleveldetails_controller.dart';

class CarrierleveldetailsView extends GetView<CarrierleveldetailsController> {
  const CarrierleveldetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ThemeClass.secondaryColor),
        backgroundColor: ThemeClass.lightPrimaryColor,
        title: Text(
          'Carrier Level Details',
          style: GoogleFonts.teko(
            color: ThemeClass.secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        // Added SingleChildScrollView here
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: exactTable(),
        ),
      ),
      floatingActionButton: const FloatingActionWidget(),
    );
  }
}

Widget exactTable() {
  return LayoutBuilder(
    builder: (context, constraints) {
      double tableWidth = constraints.maxWidth;

      return Table(
        border: TableBorder.all(color: Colors.grey[400]!),
        columnWidths: {
          0: FixedColumnWidth(tableWidth * 0.1), // Adjusted for responsiveness
          1: FlexColumnWidth(2),
          2: FixedColumnWidth(tableWidth * 0.3), // Adjusted for responsiveness
          3: FixedColumnWidth(tableWidth * 0.3), // Adjusted for responsiveness
        },
        children: [
          TableRow(
            decoration: BoxDecoration(color: ThemeClass.lightPrimaryColor),
            children: [
              tableCell("NO", isHeader: true),
              tableCell("DEPARTMENT", isHeader: true),
              tableCell("CARRIER LEVEL", isHeader: true),
              tableCell("ACTION", isHeader: true),
            ],
          ),
          TableRow(
            decoration: BoxDecoration(color: Colors.grey[200]),
            children: [
              tableCell("1"),
              tableCell("HR"),
              tableCell("Junior"),
              actionCell(),
            ],
          ),
          TableRow(
            children: [
              tableCell("2"),
              tableCell("IT"),
              tableCell("Mid"),
              actionCell(),
            ],
          ),
          TableRow(
            decoration: BoxDecoration(color: Colors.grey[200]),
            children: [
              tableCell("3"),
              tableCell("Finance"),
              tableCell("Senior"),
              actionCell(),
            ],
          ),
          TableRow(
            decoration: BoxDecoration(color: Colors.grey[200]),
            children: [
              tableCell("4"),
              tableCell("HR"),
              tableCell("Junior"),
              actionCell(),
            ],
          ),
          TableRow(
            children: [
              tableCell("5"),
              tableCell("IT"),
              tableCell("Mid"),
              actionCell(),
            ],
          ),
          TableRow(
            decoration: BoxDecoration(color: Colors.grey[200]),
            children: [
              tableCell("6"),
              tableCell("Finance"),
              tableCell("Senior"),
              actionCell(),
            ],
          ),
          TableRow(
            decoration: BoxDecoration(color: Colors.grey[200]),
            children: [
              tableCell("7"),
              tableCell("Marketing"),
              tableCell("Junior"),
              actionCell(),
            ],
          ),
          TableRow(
            children: [
              tableCell("8"),
              tableCell("Sales"),
              tableCell("Mid"),
              actionCell(),
            ],
          ),
          TableRow(
            decoration: BoxDecoration(color: Colors.grey[200]),
            children: [
              tableCell("9"),
              tableCell("Support"),
              tableCell("Senior"),
              actionCell(),
            ],
          ),
          TableRow(
            decoration: BoxDecoration(color: Colors.grey[200]),
            children: [
              tableCell("10"),
              tableCell("Admin"),
              tableCell("Mid"),
              actionCell(),
            ],
          ),
        ],
      );
    },
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
