import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Widgets/Popups/AddleaveApplicationPopupemploye .dart';
import '../../../utils/themes.dart';
import '../../leavehistory/views/leavehistory_view.dart';
import '../controllers/employee_leave_details_controller.dart';

class EmployeeLeaveDetailsView extends GetView<EmployeeLeaveDetailsController> {
  const EmployeeLeaveDetailsView({super.key});
  @override
  build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [Expanded(child: _buildLeaveHistoryTable(screenWidth))],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: ThemeClass.lightPrimaryColor,

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
                            child: AddleaveApplicationPopupemploye(),
                          ),
                        ),
                  );
                  // Add functionality
                },
                tooltip: 'Apply leave',
                child: Icon(Icons.add, color: ThemeClass.secondaryColor),
              ),
              SizedBox(height: 16), // Spacing between buttons
              FloatingActionButton(
                backgroundColor: Colors.grey.shade400, // Vibrant modern look
                onPressed: () {
                  Get.to(LeavehistoryView());
                },
                tooltip: 'Leave History',
                child: Icon(
                  Icons.history,
                  color: Colors.black,
                ), // Intuitive history icon
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: ThemeClass.lightPrimaryColor,
      title: Text(
        'EMPLOYEE LEAVE',
        style: GoogleFonts.teko(
          color: ThemeClass.secondaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  /// Responsive Leave History Table
  _buildLeaveHistoryTable(double screenWidth) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double columnWidth = screenWidth > 600 ? 90.0 : 50.0;

          return Table(
            border: TableBorder.all(color: Colors.grey),
            columnWidths: {
              0: FixedColumnWidth(columnWidth * 0.9),
              1: FixedColumnWidth(columnWidth),
              2: FixedColumnWidth(columnWidth),
              3: FixedColumnWidth(columnWidth * 0.9),
              4: FixedColumnWidth(columnWidth * 1.5),
              5: FixedColumnWidth(columnWidth * 1.5),
              6: FixedColumnWidth(columnWidth * 0.9),
            },
            children: [_buildTableHeaderRow(), ..._buildTableDataRows()],
          );
        },
      ),
    );
  }

  TableRow _buildTableHeaderRow() {
    return TableRow(
      decoration: BoxDecoration(color: ThemeClass.lightPrimaryColor),
      children: const [
        TableHeaderText("S. No"),
        TableHeaderText("From"),
        TableHeaderText("To"),
        TableHeaderText("Days"),
        TableHeaderText("Reason"),
        TableHeaderText("Status"),
        TableHeaderText("Edit"),
      ],
    );
  }

  List<TableRow> _buildTableDataRows() {
    return List.generate(6, (index) {
      return TableRow(
        children: [
          TableDataText("${index + 1}"),
          const TableDataText("2024-02-10"),
          const TableDataText("2024-02-12"),
          const TableDataText("3"),
          const TableDataText("Personal Leave"),
          const TableDataText("Pending"),
          TableCell(
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 248, 248, 248),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue, size: 16),
                  onPressed: () => Get.to(''),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
