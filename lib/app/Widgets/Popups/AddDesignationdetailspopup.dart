import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm/app/utils/themes.dart';

class AddDesignationDetailsPopup extends StatefulWidget {
  const AddDesignationDetailsPopup({super.key});

  @override
  _AddDesignationDetailsPopupState createState() =>
      _AddDesignationDetailsPopupState();
}

class _AddDesignationDetailsPopupState
    extends State<AddDesignationDetailsPopup> {
  final _formKey = GlobalKey<FormState>();
  final RxString departmentName = ''.obs;
  final RxString careerLevel = ''.obs;

  // Remove duplicates in department and career level lists
  final List<String> departmentList =
      [
        'HR',
        'Finance',
        'IT',
        'Sales',
        'Marketing',
      ].toSet().toList(); // Remove duplicates

  final List<String> careerLevels =
      [
        'Career Level I',
        'Career Level II',
        'Career Level III',
      ].toSet().toList(); // Remove duplicates

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enquiry Submitted Successfully!")),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get MediaQuery data
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeClass.lightPrimaryColor,
        title: Text(
          'Add Designation',
          style: GoogleFonts.teko(
            color: ThemeClass.secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize:
                width * 0.05, // Adjust title font size based on screen width
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.cancel, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsets.all(
              width * 0.05,
            ), // Adjust padding based on screen width
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DEPARTMENT:',
                  style: GoogleFonts.teko(
                    color: ThemeClass.accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.045, // Adjust text size
                  ),
                ),
                SizedBox(height: height * 0.02), // Adjust spacing
                _buildDropdownButton("Department Name", departmentName),
                SizedBox(height: height * 0.02), // Adjust spacing
                Text(
                  'CARRIER LEVEL:',
                  style: GoogleFonts.teko(
                    color: ThemeClass.accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.045, // Adjust text size
                  ),
                ),
                SizedBox(height: height * 0.02), // Adjust spacing
                _buildCareerLevelDropdown("Carrier Level", careerLevel),
                SizedBox(height: height * 0.02), // Adjust spacing
                Text(
                  'DESIGNATION:',
                  style: GoogleFonts.teko(
                    color: ThemeClass.accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.045, // Adjust text size
                  ),
                ),
                _buildTextField("Enter Designation", careerLevel),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(
          width * 0.05,
        ), // Adjust padding based on screen width
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [ _buildCancelButton(),_buildSaveButton(),],
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: _submitForm,
        style: ElevatedButton.styleFrom(
          backgroundColor: ThemeClass.lightPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 15,
          ), // Keep padding constant
          textStyle: GoogleFonts.teko(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text("Save", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildCancelButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () => Get.back(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 15,
          ), // Keep padding constant
          textStyle: GoogleFonts.teko(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          shadowColor: Colors.black.withOpacity(0.3),
          elevation: 5,
        ),
        child: Text("Cancel"),
      ),
    );
  }

  // Replacing DropdownButton with a normal TextField for Carrier Level
  Widget _buildTextField(String label, RxString controllerValue) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        return TextFormField(
          initialValue: controllerValue.value,
          decoration: InputDecoration(
              errorStyle: GoogleFonts.teko(
                    color: Colors.red,
                    fontSize:16,
                    fontWeight: FontWeight.w500,
                  ),
            labelText: label,
            labelStyle: GoogleFonts.teko(color: Colors.grey),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onChanged: (value) => controllerValue.value = value,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label*';
            }
            return null;
          },
        );
      }),
    );
  }

  // DropdownButton for Department
  Widget _buildDropdownButton(String label, RxString controllerValue) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        return DropdownButtonFormField<String>(
          value:
              departmentList.contains(controllerValue.value)
                  ? controllerValue.value
                  : null, // Ensure the value exists in the list
          decoration: InputDecoration(
              errorStyle: GoogleFonts.teko(
                    color: Colors.red,
                    fontSize:16,
                    fontWeight: FontWeight.w500,
                  ),
            labelText: label,
            labelStyle: GoogleFonts.teko(color: Colors.grey),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          items:
              departmentList
                  .map(
                    (dept) => DropdownMenuItem<String>(
                      value: dept,
                      child: Text(dept),
                    ),
                  )
                  .toList(),
          onChanged: (value) => controllerValue.value = value!,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select $label*';
            }
            return null;
          },
        );
      }),
    );
  }

  Widget _buildCareerLevelDropdown(String label, RxString controllerValue) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        return DropdownButtonFormField<String>(
          value:
              careerLevels.contains(controllerValue.value)
                  ? controllerValue.value
                  : null, // Ensure the value exists in the list
          decoration: InputDecoration(
              errorStyle: GoogleFonts.teko(
                    color: Colors.red,
                    fontSize:16,
                    fontWeight: FontWeight.w500,
                  ),
            labelText: label,
            labelStyle: GoogleFonts.teko(color: Colors.grey),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          items:
              careerLevels
                  .map(
                    (level) => DropdownMenuItem<String>(
                      value: level,
                      child: Text(level),
                    ),
                  )
                  .toList(),
          onChanged: (value) => controllerValue.value = value!,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select $label*';
            }
            return null;
          },
        );
      }),
    );
  }
}
