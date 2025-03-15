import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart'; // Import the Google Fonts package
import 'package:hrm/app/Widgets/Popups/AddLeavebyadminpopup.dart';

import '../../../Widgets/Popups/AddleaveApplicationPopupemploye .dart';
import '../../../utils/themes.dart';
import '../../EmployeeDetails/views/employee_details_view.dart';
import '../controllers/admin_leave_details_controller.dart';

class AdminLeaveDetailsView extends GetView<AdminLeaveDetailsController> {
  const AdminLeaveDetailsView({super.key});

  void _showEmployeeDetails(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Employee Details"),
          content: Text("Details of Employee $index"),
          actions: [
            TextButton(onPressed: () => Get.back(), child: const Text("Close")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: ThemeClass.lightPrimaryColor,
        title: Text(
          'ADMIN LEAVE DETAILS',
          style: GoogleFonts.teko(
            color: ThemeClass.secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Table(
                  border: TableBorder.all(color: Colors.grey.shade200),
                  columnWidths: const {
                    0: FixedColumnWidth(50.0), // NO
                    1: FixedColumnWidth(100.0), // DEPARTMENT
                    2: FixedColumnWidth(100.0), // CAREER LEVEL
                    3: FixedColumnWidth(100.0), // DESIGNATION
                    4: FixedColumnWidth(60.0), // LEAVE ENTITLEMENT
                    5: FixedColumnWidth(60.0), // LEAVE DAYS
                    6: FixedColumnWidth(100.0), // ACTIONS
                  },
                  children: [
                    // Table Header Row
                    const TableRow(
                      decoration: BoxDecoration(
                        color: ThemeClass.lightPrimaryColor,
                      ),
                      children: [
                        TableCell(child: TableHeaderText("NO")),
                        TableCell(child: TableHeaderText("DEPT")),
                        TableCell(child: TableHeaderText("CAREER LEVEL")),
                        TableCell(child: TableHeaderText("DESIGNATION")),
                        TableCell(child: TableHeaderText("LEAVE ENTITLEMENT")),
                        TableCell(child: TableHeaderText("LEAVE DAYS")),
                        TableCell(child: TableHeaderText("ACTIONS")),
                      ],
                    ),

                    // Table Data Rows
                    for (int index = 0; index < 6; index++)
                      TableRow(
                        children: [
                          TableCell(child: TableDataText('${index + 1}')),
                          TableCell(child: TableDataText('Employee $index')),
                          TableCell(child: TableDataText('Software Developer')),
                          TableCell(child: TableDataText('Senior Engineer')),
                          TableCell(child: TableDataText('15 Days')),
                          TableCell(child: TableDataText('5 Days Used')),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () => Get.to(() => ()),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.visibility,
                                    color: Colors.green,
                                  ),
                                  onPressed: () {
                                    Get.to(EmployeeDetailsView());
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
      floatingActionButton: Builder(
        builder:
            (context) => FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(16),
                          child: AddLeavebyadminpopup(),
                        ),
                      ),
                );
              },
              child: Icon(Icons.add, size: 30),
              backgroundColor: ThemeClass.lightPrimaryColor,
              foregroundColor: Colors.white,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
      ),
    );
  }
}

// Table Header Text Widget with Google Fonts
class TableHeaderText extends StatelessWidget {
  final String text;
  const TableHeaderText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.teko(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// Table Data Text Widget with Google Fonts
class TableDataText extends StatelessWidget {
  final String text;
  const TableDataText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.teko(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
