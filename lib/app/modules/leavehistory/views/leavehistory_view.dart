import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm/app/Widgets/Popups/AddLeavebyadminpopup.dart';
import 'package:hrm/app/modules/employee_leave_Details/views/employee_leave_details_view.dart';
import 'package:hrm/app/modules/leavehistory/controllers/leavehistory_controller.dart';
import '../../../utils/themes.dart';

class LeavehistoryView extends GetView<LeavehistoryController> {
  const LeavehistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController startDateController = TextEditingController();
    TextEditingController endDateController = TextEditingController();
    RxString selectedEmployee = "All Employees".obs;

    Future<void> _selectDate(
      BuildContext context,
      TextEditingController controller,
    ) async {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (picked != null) {
        controller.text = "${picked.day}-${picked.month}-${picked.year}";
      }
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ThemeClass.lightPrimaryColor,
        title: Text(
          'LEAVE HISTORY',
          style: GoogleFonts.teko(
            color: ThemeClass.secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                // 🔹 Date Pickers (Start & End Date)
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: startDateController,
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.teko(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: "Start Date",
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_today),
                            onPressed:
                                () => _selectDate(context, startDateController),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: endDateController,
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.teko(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: "End Date",
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_today),
                            onPressed:
                                () => _selectDate(context, endDateController),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),

                // 🔹 Employee Dropdown
                Obx(
                  () => DropdownButtonFormField<String>(
                    style: GoogleFonts.teko(
                      color: ThemeClass.accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                    value: selectedEmployee.value,
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.teko(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: "Choose Employee",
                    ),
                    items:
                        [
                              "All Employees",
                              "Employee 1",
                              "Employee 2",
                              "Employee 3",
                            ]
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        selectedEmployee.value = value;
                      }
                    },
                  ),
                ),
                const SizedBox(height: 30),

                // 🔹 Apply Leave Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(
                          30,
                          20,
                        ), // Set minimum width and height
                        backgroundColor:
                            ThemeClass.lightPrimaryColor, // Customize color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        child: Text(
                          "Apply Leave",
                          style: GoogleFonts.teko(
                            fontWeight: FontWeight.bold,
                            color: ThemeClass.secondaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(
                          30,
                          20,
                        ), // Set minimum width and height
                        backgroundColor:
                            ThemeClass.lightPrimaryColor, // Customize color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Get.to(
                          () => EmployeeLeaveDetailsView(),
                        ); // Correct way to navigate
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        child: Text(
                          "Leave history",
                          style: GoogleFonts.teko(
                            fontWeight: FontWeight.bold,
                            color: ThemeClass.secondaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 18),

          // 🔹 Leave History Table
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              // scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Leave History",
                      style: GoogleFonts.teko(
                        fontWeight: FontWeight.bold,
                        color: ThemeClass.accentColor,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Table(
                      border: TableBorder.all(color: Colors.grey),
                      columnWidths: const {
                        0: FixedColumnWidth(40.0),
                        1: FixedColumnWidth(60.0),
                        2: FixedColumnWidth(80.0),
                        3: FixedColumnWidth(54.0),
                        4: FixedColumnWidth(70.0),
                        5: FixedColumnWidth(80.0),
                      },
                      children: [
                        TableRow(
                          decoration: BoxDecoration(
                            color: ThemeClass.lightPrimaryColor,
                          ),
                          children: [
                            TableHeaderText("S. No"),
                            TableHeaderText("From"),
                            TableHeaderText("To"),
                            TableHeaderText("Days"),
                            TableHeaderText("Reason"),
                            TableHeaderText("Status"),
                          ],
                        ),
                        TableRow(
                          children: const [
                            TableDataText("1"),
                            TableDataText("2024-02-01"),
                            TableDataText("2024-02-05"),
                            TableDataText("5"),
                            TableDataText("Medical Leave"),
                            TableDataText("Approved"),
                          ],
                        ),
                        TableRow(
                          children: const [
                            TableDataText("2"),
                            TableDataText("2024-02-10"),
                            TableDataText("2024-02-12"),
                            TableDataText("3"),
                            TableDataText("Personal Leave"),
                            TableDataText("Pending"),
                          ],
                        ),
                        TableRow(
                          children: const [
                            TableDataText("3"),
                            TableDataText("2024-02-10"),
                            TableDataText("2024-02-12"),
                            TableDataText("3"),
                            TableDataText("Personal Leave"),
                            TableDataText("Pending"),
                          ],
                        ),
                        TableRow(
                          children: const [
                            TableDataText("4"),
                            TableDataText("2024-02-10"),
                            TableDataText("2024-02-12"),
                            TableDataText("3"),
                            TableDataText("Personal Leave"),
                            TableDataText("Pending"),
                          ],
                        ),
                        TableRow(
                          children: const [
                            TableDataText("5"),
                            TableDataText("2024-02-10"),
                            TableDataText("2024-02-12"),
                            TableDataText("3"),
                            TableDataText("Personal Leave"),
                            TableDataText("Pending"),
                          ],
                        ),
                        TableRow(
                          children: const [
                            TableDataText("6"),
                            TableDataText("2024-02-10"),
                            TableDataText("2024-02-12"),
                            TableDataText("3"),
                            TableDataText("Personal Leave"),
                            TableDataText("Pending"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TableHeaderText extends StatelessWidget {
  final String text;
  const TableHeaderText(this.text, {super.key});

  @override
  build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.teko(
            fontWeight: FontWeight.bold,
            color: ThemeClass.secondaryColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

// Table Data Text Widget
class TableDataText extends StatelessWidget {
  final String text;
  const TableDataText(this.text, {super.key});

  @override
  build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.teko(
            fontWeight: FontWeight.bold,
            color: ThemeClass.accentColor,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
