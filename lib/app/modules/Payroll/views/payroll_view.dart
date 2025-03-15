import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart'; // Add this import

import '../../../utils/themes.dart';
import '../controllers/payroll_controller.dart';

class PayrollView extends GetView<PayrollController> {
  final PayrollController controller = Get.put(PayrollController());
  PayrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ThemeClass.secondaryColor),
        title: Text(
          'PayRoll Generate',
          style: GoogleFonts.teko(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: ThemeClass.lightPrimaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDesignationDetails(),
            const SizedBox(height: 24),
            _buildEmployeeDetails(),
            const SizedBox(height: 24),
            _buildSalaryDetailsTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildDesignationDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Designation Details',
          style: GoogleFonts.teko(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'CAREER LEVEL DETAILS', // Fixed Typo
          style: GoogleFonts.teko(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Obx(
          () => DropdownButtonFormField<String>(
            value: controller.selectedCareerLevel.value,
            hint: Text('Please select', style: GoogleFonts.teko()),
            items:
                controller.careerLevels.map((level) {
                  return DropdownMenuItem(
                    value: level,
                    child: Text(level, style: GoogleFonts.teko()),
                  );
                }).toList(),
            onChanged: (value) {
              controller.selectedCareerLevel.value = value;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Payroll Generated Info',
          style: GoogleFonts.teko(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextFormField(
          style: GoogleFonts.teko(),
          initialValue: 'Jan - 2025',
          readOnly: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
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
        Text('Employee Name: Deng Samuel Bior', style: GoogleFonts.teko()),
        Text('Position: Accountant', style: GoogleFonts.teko()),
        Text('Department: Finance', style: GoogleFonts.teko()),
        Text('Duty Station: Juba', style: GoogleFonts.teko()),
        Text('Employment Start Date: 1st Jan 2025', style: GoogleFonts.teko()),
      ],
    );
  }

  Widget _buildSalaryDetailsTable() {
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
        const SizedBox(height: 8),
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
            columnWidths: const {
              0: FlexColumnWidth(),
              1: IntrinsicColumnWidth(),
            },
            children:
                salaryData.map((data) {
                  return TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 200,
                          child: Text(
                            data['description']!,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.teko(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            data['amount']!,
                            style: GoogleFonts.teko(),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
