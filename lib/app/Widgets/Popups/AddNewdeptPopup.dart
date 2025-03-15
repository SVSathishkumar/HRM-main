import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm/app/utils/themes.dart';

class AddNewdeptPopup extends StatefulWidget {
  const AddNewdeptPopup({super.key});

  @override
  State<AddNewdeptPopup> createState() => _AddNewdeptPopupState();
}

class _AddNewdeptPopupState extends State<AddNewdeptPopup> {
  final _formKey = GlobalKey<FormState>();

  final RxString departmentName = ''.obs;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, you can process the data here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enquiry Submitted Successfully!")),
      );
      // Close the dialog
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size from MediaQuery
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeClass.lightPrimaryColor,
        title: Text(
          'Add Dept. Form',
          style: GoogleFonts.teko(
            color: ThemeClass.secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: width * 0.05, // Dynamic font size based on screen width
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.cancel, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ADD DEPT.DETAILS :',
                style: GoogleFonts.teko(
                  color: ThemeClass.accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize:
                      width * 0.06, // Dynamic font size based on screen width
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ), // Adjusting spacing based on screen height
              _buildTextField("Department Name", departmentName),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(width * 0.05),
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

  Widget _buildTextField(
    String label,
    RxString controllerValue, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    IconData? prefixIcon,
    IconData? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        return TextFormField(
          controller: TextEditingController(text: controllerValue.value)
            ..selection = TextSelection.collapsed(
              offset: controllerValue.value.length,
            ),
          decoration: InputDecoration(
           errorStyle: GoogleFonts.teko(
                    color: Colors.red,
                    fontSize:16,
                    fontWeight: FontWeight.w500,
                  ),
            labelText: label,
            labelStyle: GoogleFonts.teko(color: Colors.grey),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            prefixIcon:
                prefixIcon != null
                    ? Icon(prefixIcon, color: Colors.grey)
                    : null,
            suffixIcon:
                suffixIcon != null
                    ? Icon(suffixIcon, color: Colors.grey)
                    : null,
          ),
          style: GoogleFonts.teko(),
          keyboardType: keyboardType,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter $label*';
            }
            return null;
          },
          onChanged: (value) => controllerValue.value = value,
          maxLines: maxLines,
          
        );
      }),
    );
  }
}
