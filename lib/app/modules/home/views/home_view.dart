import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm/app/utils/themes.dart';

import '../../../Widgets/Appdrawer.dart';
import '../../../Widgets/my_box.dart';
import '../../../Widgets/pie_chart/pie_chart.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust grid column count based on screen size
    int crossAxisCount =
        screenWidth > 600 ? 3 : 2; // More columns for larger screens

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: ThemeClass.secondaryColor,
          size: screenWidth * 0.06, // Responsive icon size
        ),
        backgroundColor: ThemeClass.lightPrimaryColor,
        title: Text(
          'DASHBOARD',
          style: GoogleFonts.teko(
            color: ThemeClass.secondaryColor,
            fontWeight: FontWeight.bold, 
          ),   
        ),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // First 4 boxes in grid
              AspectRatio(
                aspectRatio: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics:
                        NeverScrollableScrollPhysics(), // Disable GridView scrolling
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          crossAxisCount, // Use MediaQuery-based crossAxisCount
                      childAspectRatio:
                          screenWidth > 600 ? 1.2 : 1, // Adjust aspect ratio
                    ),
                    itemBuilder: (context, index) {
                      List<String> titles = [
                        "Employees",
                        "Leave Requests",
                        "Payroll & Salary",
                        "Recruitments",
                      ];

                      List<IconData> icons = [
                        CupertinoIcons.person_2_fill,
                        CupertinoIcons.calendar_badge_plus,
                        CupertinoIcons.money_dollar_circle,
                        CupertinoIcons.briefcase_fill,
                      ];

                      List<VoidCallback> actions = [
                        () => print("Employees Pressed"),
                        () => print("Leave Requests Pressed"),
                        () => print("Payroll Pressed"),
                        () => print("Recruitments Pressed"),
                      ];

                      List<Color> colors = [
                        Colors.red,
                        Colors.green,
                        Colors.orange,
                        ThemeClass.lightPrimaryColor,
                      ];

                      return MyBox(
                        title: titles[index],
                        icon: icons[index],
                        onTap: actions[index],
                        color: colors[index],
                      );
                    },
                  ),
                ),
              ),

              // List of previous days
              const SizedBox(height: 10),

              // Pie Chart for HRM Analytics
              HRMPieChart(),
            ],
          ),
        ),
      ),
    );
  }
}
