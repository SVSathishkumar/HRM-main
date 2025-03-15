import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package

import '../../../utils/themes.dart';
import '../controllers/mypayslip_controller.dart';

class MypayslipView extends GetView<MypayslipController> {
  final MypayslipController controller = Get.put(MypayslipController());
  MypayslipView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ThemeClass.secondaryColor),
        title: Text(
          'My Payslip',
          style: GoogleFonts.teko(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: ThemeClass.lightPrimaryColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDesignationDetails(screenWidth),
            SizedBox(height: screenWidth * 0.06),
            _buildEmployeeDetails(),
            SizedBox(height: screenWidth * 0.06),
            _buildSubmitButton(),
            SizedBox(height: screenWidth * 0.06),
            Obx(
              () =>
                  controller.showSalaryTable.value
                      ? _buildSalaryDetailsTable(screenWidth)
                      : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesignationDetails(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Designation Details',
          style: GoogleFonts.teko(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: screenWidth * 0.03),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CAREER LEVEL',
                    style: GoogleFonts.teko(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  TextFormField(
                    style: GoogleFonts.teko(color: Colors.grey[600]),
                    initialValue: 'Career Level 1',
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.02,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payroll For',
                    style: GoogleFonts.teko(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Obx(
                    () => DropdownButtonFormField<String>(
                      style: GoogleFonts.teko(
                        color: ThemeClass.accentColor,
                        fontSize: 18,
                      ),
                      value: controller.selectedPayrollMonth.value,
                      items:
                          controller.payrollMonths.map((month) {
                            return DropdownMenuItem(
                              value: month,
                              child: Text(month),
                            );
                          }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedPayrollMonth.value = value;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEmployeeDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Company Name: Reall Tech',
          style: GoogleFonts.teko(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        Text('Employee Name: Deng Samuel Bior'),
        Text('Position: Accountant'),
        Text('Department: Finance'),
        Text('Duty Station: Juba'),
        Text('Employment Start Date: 1st Jan 2025'),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ThemeClass.lightPrimaryColor,
        ),
        onPressed: () {
          if (controller.selectedPayrollMonth.value != 'Please Select') {
            controller.showSalaryTable.value = true;
          } else {
            Get.snackbar(
              "Error",
              "Please select a payroll month",
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        },
        child: Text(
          'Submit',
          style: GoogleFonts.teko(
            color: ThemeClass.secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSalaryDetailsTable(double screenWidth) {
    final List<Map<String, String>> salaryData = [
      {'description': 'Basic Salary', 'amount': '200,000'},
      {'description': 'Allowances', 'amount': '0'},
      {'description': 'Gross Salary', 'amount': '200,000'},
      {'description': 'Income Tax', 'amount': '37,500'},
      {'description': '8% NSIF Staff Contribution', 'amount': '16,000'},
      {'description': 'Salary Advance', 'amount': '0'},
      {'description': 'Salary Loan', 'amount': '0'},
      {'description': 'Total Deduction', 'amount': '53,500'},
      {'description': 'Net Salary', 'amount': '146,500'},
      {'description': '17% NSIF Employer Contribution', 'amount': '34,000'},
      {'description': '1/12 Gratuity', 'amount': '16,667'},
      {'description': 'Total Staff Cost', 'amount': '250,667'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Salary Details',
          style: GoogleFonts.teko(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: screenWidth * 0.02),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Table(
            border: TableBorder.all(color: Colors.grey.shade300),
            children:
                salaryData
                    .map(
                      (data) => TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            child: Text(
                              data['description']!,
                              style: GoogleFonts.teko(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                data['amount']!,
                                style: GoogleFonts.teko(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }
}
