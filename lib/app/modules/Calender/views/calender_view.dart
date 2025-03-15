import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm/app/utils/themes.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../Widgets/Popups/AddEventPopup.dart';
import '../controllers/calender_controller.dart';

class CalenderView extends GetView<CalenderController> {
  final CalenderController controller = Get.put(CalenderController());
  CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        iconTheme: IconThemeData(color: ThemeClass.secondaryColor),
        backgroundColor: ThemeClass.lightPrimaryColor,
        title: Text(
          'CALENDAR EVENTS',
          style: GoogleFonts.teko(
            color: ThemeClass.secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.06, // Adjust font size
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(screenWidth * 0.03),
            padding: EdgeInsets.all(screenWidth * 0.025),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(screenWidth * 0.04),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Obx(
              () => TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: controller.focusedDay.value,
                calendarFormat: controller.calendarFormat.value,
                selectedDayPredicate:
                    (day) => isSameDay(controller.selectedDay.value, day),
                onDaySelected: (selectedDay, focusedDay) {
                  controller.selectDay(selectedDay, focusedDay);
                },
                eventLoader: (day) => controller.events[day] ?? [],
                calendarStyle: CalendarStyle(
                  defaultDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    color: Colors.grey.shade200,
                  ),
                  selectedDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    color: ThemeClass.lightPrimaryColor,
                  ),
                  todayDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    color: Colors.deepOrange,
                  ),
                  markersAlignment: Alignment.bottomCenter,
                  markerDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(screenWidth * 0.015),
                    color: Colors.redAccent,
                  ),
                  defaultTextStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.04,
                  ),
                  weekendTextStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Colors.black54,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Event List
          Expanded(
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.03),
              ),
              child: Obx(() {
                var selectedEvents =
                    controller.events[controller.selectedDay.value] ?? [];

                if (selectedEvents.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.event_busy,
                          size: screenWidth * 0.15,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'NO EVENTS SCHEDULED',
                          style: GoogleFonts.teko(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.separated(
                  itemCount: selectedEvents.length,
                  separatorBuilder:
                      (context, index) => SizedBox(height: screenWidth * 0.03),
                  itemBuilder: (context, index) {
                    var event = selectedEvents[index];

                    return Card(
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      ),
                      elevation: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.03,
                          ),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: screenWidth * 0.04,
                            horizontal: screenWidth * 0.05,
                          ),
                          leading: Container(
                            padding: EdgeInsets.all(screenWidth * 0.03),
                            decoration: BoxDecoration(
                              color: ThemeClass.lightPrimaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.event,
                              color: Colors.white,
                              size: screenWidth * 0.06,
                            ),
                          ),
                          title: Text(
                            event["name"] ?? "No Title",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: screenWidth * 0.045,
                              color: Colors.black87,
                            ),
                          ),
                          subtitle: Text(
                            event["description"] ?? "No Description",
                            style: TextStyle(
                              color: Colors.blueGrey[700],
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => AddEventPopup.show(controller),
        backgroundColor: ThemeClass.lightPrimaryColor,
        child: Icon(Icons.add, color: Colors.white, size: screenWidth * 0.07),
      ),
    );
  }
}
