import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:hrm/app/modules/EmployeeDetails/views/employee_details_view.dart';
import 'package:hrm/app/modules/employee_list/controllers/employee_list_controller.dart';
import '../../../utils/themes.dart';
import '../../new_employeee/views/new_employeee_view.dart';

class EmpoyeeListView extends GetView<EmployeeListController> {
  const EmpoyeeListView({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> employees = [
      {
        "NO": "1",
        "NAME": "John",
        "DESIGNATION": "Software Developer",
        "MOBILE": "9551673732",
        "EMAIL": "john@enuite.com",
        "ADDRESS": "98/12, Kazhakutom, Karala - 695581",
        "JOINING_DATE": "07-01-2022",
        "ACTION": "✅ 👁",
      },
      {
        "NO": "2",
        "NAME": "EDWIN",
        "DESIGNATION": "Software Developer",
        "MOBILE": "8137838689",
        "EMAIL": "edwin4@gmail.com",
        "ADDRESS": "Neeramankara, Thiruvananthapuram",
        "JOINING_DATE": "11-02-2022",
        "ACTION": "✅ 👁",
      },
      {
        "NO": "3",
        "NAME": "Jewel",
        "DESIGNATION": "HR",
        "MOBILE": "7356048146",
        "EMAIL": "jewelfgf@enuite.in",
        "ADDRESS": "BETHEL Trinandrum",
        "JOINING_DATE": "12-13-2022",
        "ACTION": "✅ 👁",
      },
      {
        "NO": "4",
        "NAME": "Admin",
        "DESIGNATION": "CTO",
        "MOBILE": "9744520001",
        "EMAIL": "admin12@enuite.com",
        "ADDRESS": "62 South Street",
        "JOINING_DATE": "08-23-2018",
        "ACTION": "✅ 👁",
      },
      {
        "NO": "5",
        "NAME": "Kumar",
        "DESIGNATION": "Software Developer",
        "MOBILE": "6380225014",
        "EMAIL": "kumarer638017@gmail.com",
        "ADDRESS": "98/12, Nils Karala- 695581",
        "JOINING_DATE": "01-20-2023",
        "ACTION": "✅ 👁",
      },
      {
        "NO": "6",
        "NAME": "Regina",
        "DESIGNATION": "Accounts Manager",
        "MOBILE": "6383778115",
        "EMAIL": "regi03@gmail.com",
        "ADDRESS": "275/ South Road, Nigercoil.",
        "JOINING_DATE": "06-01-2019",
        "ACTION": "✅ 👁",
      },
      {
        "NO": "7",
        "NAME": "Santosh",
        "DESIGNATION": "Software Developer",
        "MOBILE": "9894538945",
        "EMAIL": "santoshan@gmail.com",
        "ADDRESS": "98/12, Kazhakutom, Karala - 695581",
        "JOINING_DATE": "09-25-2023",
        "ACTION": "✅ 👁",
      },
      {
        "NO": "8",
        "NAME": "Jerin",
        "DESIGNATION": "Software Developer",
        "MOBILE": "8589078975",
        "EMAIL": "jerin@gmail.com",
        "ADDRESS": "Jessy Cottage, Trinandrum-695573",
        "JOINING_DATE": "02-01-2024",
        "ACTION": "✅ 👁",
      },
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: ThemeClass.lightPrimaryColor,
        title: Text(
          'Employee list detalis',
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
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  // onPressed: () {
                  //   Get.to(() => NewEmployeeeView());
                  // },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeClass.lightPrimaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  child: Text(
                    "Add New Employee",
                    style: GoogleFonts.teko(
                      color: ThemeClass.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  // onPressed: () {
                  //   Get.to(() => EmployeeTableScreen());
                  // },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeClass.lightPrimaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  child: Text(
                    "Resigned Employee",
                    style: GoogleFonts.teko(
                      color: ThemeClass.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                child: DataTable(
                  columnSpacing: 20.0,
                  dataRowHeight: 60.0,
                  headingRowHeight: 60.0,
                  headingRowColor: MaterialStateColor.resolveWith(
                    (states) => ThemeClass.lightPrimaryColor,
                  ),
                  headingTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  columns: [
                    DataColumn(
                      label: Text(
                        'NO',
                        style: GoogleFonts.teko(
                          color: ThemeClass.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'NAME',
                        style: GoogleFonts.teko(
                          color: ThemeClass.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'DESIGNATION',
                        style: GoogleFonts.teko(
                          color: ThemeClass.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'MOBILE',
                        style: GoogleFonts.teko(
                          color: ThemeClass.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'EMAIL',
                        style: GoogleFonts.teko(
                          color: ThemeClass.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'ADDRESS',
                        style: GoogleFonts.teko(
                          color: ThemeClass.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'JOINING DATE',
                        style: GoogleFonts.teko(
                          color: ThemeClass.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'ACTION',
                        style: GoogleFonts.teko(
                          color: ThemeClass.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  rows:
                      employees.map<DataRow>((employee) {
                        return DataRow(
                          cells: [
                            DataCell(
                              Text(
                                employee['NO'] ?? '',
                                style: GoogleFonts.teko(
                                  color: ThemeClass.accentColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                employee['NAME'] ?? '',
                                style: GoogleFonts.teko(
                                  color: ThemeClass.accentColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                employee['DESIGNATION'] ?? '',
                                style: GoogleFonts.teko(
                                  color: ThemeClass.accentColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                employee['MOBILE'] ?? '',
                                style: GoogleFonts.teko(
                                  color: ThemeClass.accentColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                employee['EMAIL'] ?? '',
                                style: GoogleFonts.teko(
                                  color: ThemeClass.accentColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                employee['ADDRESS'] ?? '',
                                style: GoogleFonts.teko(
                                  color: ThemeClass.accentColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                employee['JOINING_DATE'] ?? '',
                                style: GoogleFonts.teko(
                                  color: ThemeClass.accentColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataCell(
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ),
                                    onPressed: () {
                                      // Approve action
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.visibility,
                                      color: Colors.blue,
                                    ),
                                    onPressed: () {
                                      Get.to(EmployeeDetailsView());
                                      // View details action
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
