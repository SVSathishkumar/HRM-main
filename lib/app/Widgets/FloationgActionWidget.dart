import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/themes.dart';
import 'Popups/AddNewdeptPopup.dart';
import 'Popups/AddNewcarrierpopup.dart';
import 'Popups/AddDesignationdetailspopup.dart';

class FloatingActionWidget extends StatelessWidget {
  const FloatingActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Tooltip(
      message: 'Add New Inquiry', // Set the tooltip message
      child: FloatingActionButton(
        elevation: 2,
        backgroundColor: ThemeClass.lightPrimaryColor,
        onPressed: () {
          String currentRoute = Get.currentRoute;

          // Check the current route and show the corresponding popup
          if (currentRoute == '/DepartmentdetailsView') {
            Get.dialog(
              Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  width: width * 0.8, // Responsive width
                  height: height * 0.5, // Responsive height
                  padding: EdgeInsets.all(16),
                  child: AddNewdeptPopup(),
                ),
              ),
            );
          } else if (currentRoute == '/CarrierleveldetailsView') {
            Get.dialog(
              Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  width: width * 0.8, // Responsive width
                  height: height * 0.5, // Responsive height
                  padding: EdgeInsets.all(16),
                  child: Addnewcarrierpopup(),
                ),
              ),
            );
          } else if (currentRoute == '/DesignationdetailsView') {
            Get.dialog(
              Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  width: width * 0.8, // Responsive width
                  height: height * 0.5, // Responsive height
                  padding: EdgeInsets.all(16),
                  child: AddDesignationDetailsPopup(),
                ),
              ),
            );
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Icon(CupertinoIcons.add, color: ThemeClass.secondaryColor),
      ),
    );
  }
}
