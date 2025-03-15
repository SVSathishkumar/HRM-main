import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm/app/utils/themes.dart';
import '../controllers/employee_details_controller.dart';

class EmployeeDetailsView extends StatelessWidget {
  EmployeeDetailsView({Key? key}) : super(key: key);

  final controller = Get.put(EmployeeDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color:ThemeClass.secondaryColor),
        backgroundColor: ThemeClass.lightPrimaryColor,
        title: Text(
          'Employee Details',
          style: GoogleFonts.teko(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPersonalDetailsCard(),
            SizedBox(height: 10),
            _buildKycDetailsCard(),
            SizedBox(height: 10),
            _buildEmploymentDetailsCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalDetailsCard() {
    return _buildCard(
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Personal Details",
                  style: GoogleFonts.teko(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ThemeClass.lightPrimaryColor,
                  ),
                ),
                Obx(
                  () => IconButton(
                    icon: Icon(
                      controller.isEditing.value ? Icons.save : Icons.edit,
                      color: ThemeClass.lightPrimaryColor,
                    ),
                    tooltip:
                        controller.isEditing.value
                            ? "Save Details"
                            : "Edit Details",
                    onPressed: controller.toggleEdit,
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1),
            _buildDetailRow("First Name", controller.firstName),
            _buildDetailRow("Last Name", controller.lastName),
            _buildDetailRow("Father's Name", controller.fatherName),
            _buildDetailRow("Phone Number", controller.phoneNumber),
            _buildDetailRow("Emergency Contact", controller.emergencyContact),
            _buildDetailRow("Email", controller.email),
            _buildDetailRow(
              "Marital Status",
              controller.maritalStatus,
              color: Colors.red,
            ),
            _buildDetailRow("Designation", controller.designation),
            _buildDetailRow("Role", controller.role),
            _buildDetailRow("Joining Date", controller.joiningDate),
            _buildDetailRow("Relieving Date", controller.relievingDate),
          ],
        ),
      ),
    );
  }

  Widget _buildKycDetailsCard() {
    return _buildCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'KYC Details',
            style: GoogleFonts.teko(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          _buildDetailRow("Aadhaar Number", controller.aadhaar),
          _buildDetailRow("PAN Number", controller.pan),
          _buildDetailRow("Passport Number", controller.passport),
          _buildDetailRow("NPS Account", controller.npsAccount),
          _buildDetailRow("PF Account", controller.pfAccount),
          _buildDetailRow("Uploaded Docs", controller.uploadedDocs),
        ],
      ),
    );
  }

  Widget _buildEmploymentDetailsCard(BuildContext context) {
    return _buildCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Employee Details',
              style: GoogleFonts.teko(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ThemeClass.lightPrimaryColor,
              ),
            ),
          ),
          Divider(thickness: 1),
          _buildDropdown(
            "Designation",
            controller.selectedDesignation,
            controller.designations,
          ),
          _buildDropdown("Role", controller.selectedRole, controller.roles),
          _buildDateField(
            context,
            "Joining Date",
            controller.joiningDateController,
          ),
          _buildDateField(
            context,
            "Relieving Date",
            controller.relievingDateController,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Obx(
              () => CheckboxListTile(
                title: Text(
                  "Relieving Status",
                  style: GoogleFonts.teko(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: controller.isRelieved.value,
                onChanged: (value) => controller.isRelieved.value = value!,
                activeColor: ThemeClass.lightPrimaryColor,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          _buildReadOnlyField("Employee ID", controller.employeeId),
          SizedBox(height: 16), // Adds spacing before the button
          // 🔥 Modern Elevated Button
          SizedBox(
            width: double.infinity, // Makes button full-width
            child: ElevatedButton(
              onPressed: () {
                // Handle button action
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: 14,
                ), // Adjust button height
                backgroundColor: ThemeClass.lightPrimaryColor, // Primary color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ), // Smooth corners
                elevation: 4, // Adds a soft shadow
              ),
              child: Text(
                "Submit",
                style: GoogleFonts.teko(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Improved Dropdown
  Widget _buildDropdown(
    String title,
    RxString selectedValue,
    List<String> items,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.teko(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 5),
          Obx(
            () => DropdownButtonFormField<String>(
              value: selectedValue.value,
              isExpanded: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                if (value != null) selectedValue.value = value;
              },
              items:
                  items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: GoogleFonts.teko(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Improved Date Picker
  Widget _buildDateField(
    BuildContext context,
    String title,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.teko(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 5),
          TextField(
            controller: controller,
            readOnly: true,
            decoration: InputDecoration(
              hintText: "Select Date",
              hintStyle:  GoogleFonts.teko(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              suffixIcon: Icon(
                Icons.calendar_today,
                color: ThemeClass.lightPrimaryColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 12,
              ),
            ),
            onTap: () {
              Get.find<EmployeeDetailsController>().pickDate(
                context,
                controller,
              );
            },
          ),
        ],
      ),
    );
  }

  // 🔹 Improved Read-Only Field
  Widget _buildReadOnlyField(String title, RxString value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.teko(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 5),
          Obx(
            () => TextFormField(
              initialValue: value.value,
              readOnly: true,
              style: GoogleFonts.teko(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(Widget child) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ), // More balanced spacing
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 16,
      ), // Better internal spacing
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }

  // 🔹 Refactored _buildDetailRow to support both view & edit mode
  Widget _buildDetailRow(String title, RxString value, {Color? color}) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          children: [
            SizedBox(
              width: 150,
              child: Text(
                title,
                style: GoogleFonts.teko(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
            Expanded(
              child:
                  controller.isEditing.value
                      ? TextFormField(
                        initialValue: value.value,
                        onChanged: (newValue) => value.value = newValue,
                        style: GoogleFonts.teko(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: color ?? Colors.black87,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                      )
                      : Text(
                        value.value,
                        style: GoogleFonts.teko(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: color ?? Colors.black87,
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
