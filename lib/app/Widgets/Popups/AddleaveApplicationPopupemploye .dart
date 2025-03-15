import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../utils/themes.dart';

class AddleaveApplicationPopupemploye extends StatefulWidget {
  AddleaveApplicationPopupemploye({super.key});

  @override
  _AddleaveApplicationPopupemployeState createState() =>
      _AddleaveApplicationPopupemployeState();
}

class _AddleaveApplicationPopupemployeState
    extends State<AddleaveApplicationPopupemploye> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController allottedHolidaysController =
      TextEditingController();
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  String? fromSession;
  String? toSession;

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
      setState(() {
        controller.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Add Leave application Form",
                style: TextStyle(
                  color: ThemeClass.lightPrimaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
              },
              children: [
                _buildTableRow(
                  "From Date",
                  TextFormField(
                    controller: fromDateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      errorStyle: GoogleFonts.teko(
                        color: Colors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () => _selectDate(context, fromDateController),
                  ),
                ),
                _buildTableRow(
                  "From Session",
                  DropdownButtonFormField<String>(
                    style: GoogleFonts.teko(
                      color: ThemeClass.accentColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      errorStyle: GoogleFonts.teko(
                        color: Colors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    items:
                        ["Morning", "Afternoon"].map((String session) {
                          return DropdownMenuItem<String>(
                            value: session,
                            child: Text(session),
                          );
                        }).toList(),
                    onChanged: (value) => setState(() => fromSession = value),
                    validator:
                        (value) =>
                            value == null ? "Please select a session*" : null,
                  ),
                ),
                _buildTableRow(
                  "To Date",
                  TextFormField(
                    controller: toDateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      errorStyle: GoogleFonts.teko(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () => _selectDate(context, toDateController),
                  ),
                ),
                _buildTableRow(
                  "To Session",
                  DropdownButtonFormField<String>(
                    style: GoogleFonts.teko(
                      color: ThemeClass.accentColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      errorStyle: GoogleFonts.teko(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    items:
                        ["Morning", "Afternoon"].map((String session) {
                          return DropdownMenuItem<String>(
                            value: session,
                            child: Text(session),
                          );
                        }).toList(),
                    onChanged: (value) => setState(() => toSession = value),
                    validator:
                        (value) =>
                            value == null ? "Please select a session*" : null,
                  ),
                ),
                _buildTableRow(
                  "Reason",
                  TextFormField(
                    controller: reasonController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      errorStyle: GoogleFonts.teko(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? "Please enter a reason*"
                                : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.teko(
                        color: ThemeClass.secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
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
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Apply",
                      style: GoogleFonts.teko(
                        color: ThemeClass.secondaryColor,
                        fontWeight: FontWeight.bold,
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
              fontSize: 16,
              fontWeight: FontWeight.w500,
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
