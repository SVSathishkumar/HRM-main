import 'package:get/get.dart';

import '../modules/Calender/bindings/calender_binding.dart';
import '../modules/Calender/views/calender_view.dart';
import '../modules/CompanyHoliday/bindings/company_holiday_binding.dart';
import '../modules/CompanyHoliday/views/company_holiday_view.dart';
import '../modules/EmployeeDetails/bindings/employee_details_binding.dart';
import '../modules/EmployeeDetails/views/employee_details_view.dart';
import '../modules/Mypayslip/bindings/mypayslip_binding.dart';
import '../modules/Mypayslip/views/mypayslip_view.dart';
import '../modules/Payroll/bindings/payroll_binding.dart';
import '../modules/Payroll/views/payroll_view.dart';
import '../modules/admin_leave_Details/bindings/admin_leave_details_binding.dart';
import '../modules/admin_leave_Details/views/admin_leave_details_view.dart';
import '../modules/carrierleveldetails/bindings/carrierleveldetails_binding.dart';
import '../modules/carrierleveldetails/views/carrierleveldetails_view.dart';
import '../modules/departmentdetails/bindings/departmentdetails_binding.dart';
import '../modules/designationdetails/bindings/designationdetails_binding.dart';
import '../modules/designationdetails/views/designationdetails_view.dart';
import '../modules/employee_leave_Details/bindings/employee_leave_details_binding.dart';
import '../modules/employee_leave_Details/views/employee_leave_details_view.dart';
import '../modules/employee_list/bindings/employee_list_binding.dart';
import '../modules/employee_list/views/employee_list_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/leavehistory/bindings/leavehistory_binding.dart';
import '../modules/leavehistory/views/leavehistory_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/logsheet/bindings/logsheet_binding.dart';
import '../modules/logsheet/views/logsheet_view.dart';
import '../modules/nci_form/bindings/nci_form_binding.dart';
import '../modules/nci_form/views/nci_form_view.dart';
import '../modules/new_employeee/bindings/new_employeee_binding.dart';
import '../modules/new_employeee/views/new_employeee_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DEPARTMENTDETAILS,
      page: () => const DesignationdetailsView(),
      binding: DepartmentdetailsBinding(),
    ),
    GetPage(
      name: _Paths.CARRIERLEVELDETAILS,
      page: () => const CarrierleveldetailsView(),
      binding: CarrierleveldetailsBinding(),
    ),
    GetPage(
      name: _Paths.DESIGNATIONDETAILS,
      page: () => const DesignationdetailsView(),
      binding: DesignationdetailsBinding(),
    ),
    GetPage(
      name: _Paths.CALENDER,
      page: () => CalenderView(),
      binding: CalenderBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEE_DETAILS,
      page: () => EmployeeDetailsView(),
      binding: EmployeeDetailsBinding(),
    ),
    GetPage(
      name: _Paths.COMPANY_HOLIDAY,
      page: () => const CompanyHolidayView(),
      binding: CompanyHolidayBinding(),
      // children: [
      //   GetPage(
      //     name: _Paths.COMPANY_HOLIDAY,
      //     page: () => const CompanyHolidayView(),
      //     binding: CompanyHolidayBinding(),
      //   ),
      // ],
    ),
    GetPage(
      name: _Paths.LOGSHEET,
      page: () => LogsheetView(),
      binding: LogsheetBinding(),
    ),
    GetPage(
      name: _Paths.PAYROLL,
      page: () => PayrollView(),
      binding: PayrollBinding(),
    ),
    GetPage(
      name: _Paths.MYPAYSLIP,
      page: () => MypayslipView(),
      binding: MypayslipBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_LEAVE_DETAILS,
      page: () => const AdminLeaveDetailsView(),
      binding: AdminLeaveDetailsBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEE_LEAVE_DETAILS,
      page: () => const EmployeeLeaveDetailsView(),
      binding: EmployeeLeaveDetailsBinding(),
    ),
    GetPage(
      name: _Paths.LEAVEHISTORY,
      page: () => const LeavehistoryView(),
      binding: LeavehistoryBinding(),
    ),
    GetPage(
      name: _Paths.NCI_FORM,
      page: () => const NciFormView(),
      binding: NciFormBinding(),
    ),
    GetPage(
      name: _Paths.NEW_EMPLOYEEE,
      page: () => const NewEmployeeeView(),
      binding: NewEmployeeeBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEE_LIST,
      page: () => const EmpoyeeListView(),
      binding: EmployeeListBinding(),
    ),
  ];
}
