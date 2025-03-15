import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm/app/modules/Calender/views/calender_view.dart';
import 'package:hrm/app/modules/EmployeeDetails/views/employee_details_view.dart';
import 'package:hrm/app/modules/Mypayslip/views/mypayslip_view.dart';
import 'package:hrm/app/modules/Payroll/views/payroll_view.dart';
import 'package:hrm/app/modules/admin_leave_Details/views/admin_leave_details_view.dart';
import 'package:hrm/app/modules/carrierleveldetails/views/carrierleveldetails_view.dart';
import 'package:hrm/app/modules/departmentdetails/views/departmentdetails_view.dart';
import 'package:hrm/app/modules/designationdetails/views/designationdetails_view.dart';
import 'package:hrm/app/modules/employee_leave_Details/views/employee_leave_details_view.dart';
import 'package:hrm/app/modules/employee_list/views/employee_list_view.dart';
import 'package:hrm/app/modules/home/views/home_view.dart';
import 'package:hrm/app/modules/logsheet/views/logsheet_view.dart';
import '../modules/CompanyHoliday/views/company_holiday_view.dart';
import '../utils/themes.dart';
import 'Popups/LogoutPopup.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textScale = MediaQuery.of(context).textScaleFactor;

    return Drawer(
      backgroundColor: ThemeClass.secondaryColor,
      elevation: 1,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            DrawerHeader(
              child: CircleAvatar(
                radius: screenWidth * 0.12, // Responsive size
                backgroundImage: AssetImage('assets/images/rorirlogo.png'),
              ),
            ),
            buildDrawerTile(CupertinoIcons.home, 'HOME', () {
              Get.offAll(HomeView());
              print("Dashboard Clicked");
            }, textScale),
            buildExpansionTile(Icons.people_alt, 'WORKFORCE STRUCTURE', [
              buildDrawerTile(Icons.apartment, 'DEPARTMENTS DETAILS', () {
                Get.to(DepartmentdetailsView());
                print("Departments Details Clicked");
              }, textScale),
              buildDrawerTile(Icons.trending_up, 'CAREER LEVEL DETAILS', () {
                Get.to(CarrierleveldetailsView());
                print("Career Level Details Clicked");
              }, textScale),
              buildDrawerTile(Icons.badge, 'DESIGNATION DETAILS', () {
                Get.to(DesignationdetailsView());
                print("Designation Details Clicked");
              }, textScale),
            ], textScale),
            buildExpansionTile(
              Icons.supervisor_account,
              'EMPLOYEE MANAGEMENT',
              [
                buildDrawerTile(Icons.person, 'EMPLOYEE DETAILS', () {
                   Get.to(EmpoyeeListView());
                  // Get.to(EmployeeDetailsView());
                  print("Employee Details Clicked");
                 
                }, textScale),
              ],
              textScale,
            ),
            buildExpansionTile(Icons.event_available, 'LEAVE MANAGEMENT', [
              buildDrawerTile(
                Icons.admin_panel_settings,
                'ADMIN LEAVE DETAILS',
                () {
                  Get.to(AdminLeaveDetailsView());
                  print("Admin Leave Details Clicked");
                },
                textScale,
              ),
              buildDrawerTile(
                Icons.person_outline,
                'EMPLOYEE LEAVE DETAILS',
                () {
                  Get.to(EmployeeLeaveDetailsView());
                  print("Employee Leave Details Clicked");
                },
                textScale,
              ),
            ], textScale),
            buildExpansionTile(
              Icons.account_balance_wallet,
              'PAYROLL MANAGEMENT',
              [
                buildDrawerTile(Icons.receipt, 'PAYROLL GENERATION', () {
                  Get.to(PayrollView());
                  print("Payroll Generation Clicked");
                }, textScale),
                buildDrawerTile(Icons.payment, 'MY PAYSLIP', () {
                  Get.to(MypayslipView());
                  print("My Payslip Clicked");
                }, textScale),
              ],
              textScale,
            ),
            buildExpansionTile(Icons.more_horiz, 'MORE', [
              buildDrawerTile(Icons.assignment, 'LOGSHEET', () {
                Get.to(LogsheetView());
                print("Logsheet Clicked");
              }, textScale),
              buildDrawerTile(Icons.calendar_today, 'COMPANY HOLIDAYS', () {
                Get.to(CompanyHolidayView());
                print("Company Holidays Clicked");
              }, textScale),
            ], textScale),
            buildDrawerTile(Icons.calendar_today, 'CALENDAR', () {
              Get.to(CalenderView());
              print("CALENDAR Clicked");
            }, textScale),

            buildDrawerTile(Icons.logout, 'LOGOUT', () {
              // Show the logout popup when the button is clicked
              LogoutPopup.show();
            }, textScale),
          ],
        ),
      ),
    );
  }
}

Widget buildDrawerTile(
  IconData icon,
  String title,
  VoidCallback onTap,
  double textScale,
) {
  return Padding(
    padding: tilePadding,
    child: ListTile(
      leading: Icon(icon, color: ThemeClass.lightPrimaryColor),
      title: Text(
        title,
        style: GoogleFonts.teko(
          color: Colors.grey[800],
          fontSize: 18 * textScale, // Adjust font size based on textScale
        ),
      ),
      onTap: onTap,
    ),
  );
}

Widget buildExpansionTile(
  IconData icon,
  String title,
  List<Widget> children,
  double textScale,
) {
  return Padding(
    padding: tilePadding,
    child: ExpansionTile(
      leading: Icon(icon, color: ThemeClass.lightPrimaryColor),
      title: Text(
        title,
        style: GoogleFonts.teko(
          color: Colors.grey[800],
          fontSize: 18 * textScale, // Adjust font size based on textScale
        ),
      ),
      children: children,
    ),
  );
}

var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
