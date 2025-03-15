import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm/app/utils/themes.dart';

class Addnewcarrierpopup extends StatefulWidget {
  const Addnewcarrierpopup({super.key});

  @override
  _AddnewcarrierpopupState createState() => _AddnewcarrierpopupState();
}

class _AddnewcarrierpopupState extends State<Addnewcarrierpopup> {
  final _formKey = GlobalKey<FormState>();
  final RxString departmentName = ''.obs;
  final RxString carrierLevel =
      ''.obs; // Added a new RxString for carrier level

  final List<String> departmentList = [
    'HR',
    'Finance',
    'IT',
    'Sales',
    'Marketing',
    // Add other departments as required
  ];

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
    // MediaQuery for screen size
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeClass.lightPrimaryColor,
        title: Text(
          'Add Carrier Level',
          style: GoogleFonts.teko(
            color: ThemeClass.secondaryColor,
            fontWeight: FontWeight.bold,
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
              screenWidth < 600 ? 8.0 : 16.0,
            ), // Responsive padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DEPARTMENT:',
                  style: GoogleFonts.teko(
                    color: ThemeClass.accentColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                _buildDropdownButton("Department Name", departmentName),
                SizedBox(height: 10),
                Text(
                  'CARRIER LEVEL:',
                  style: GoogleFonts.teko(
                    color: ThemeClass.accentColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                _buildTextField("Carrier Level", carrierLevel),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(
          screenWidth < 600 ? 16.0 : 32.0,
        ), // Adjusted for smaller screens
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
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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

  Widget _buildTextField(String label, RxString controllerValue) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        return TextFormField(
          initialValue: controllerValue.value,
          decoration: InputDecoration(
            errorStyle: GoogleFonts.teko(
              color: Colors.red,
              fontSize: 16,
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

  Widget _buildDropdownButton(String label, RxString controllerValue) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        return DropdownButtonFormField<String>(
          value: controllerValue.value.isEmpty ? null : controllerValue.value,
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
}
