import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderController extends GetxController {
  var calendarFormat = CalendarFormat.month.obs;
  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;
  
  // Store events as a map containing name & description
  var events = <DateTime, List<Map<String, String>>>{}.obs;

  void selectDay(DateTime day, DateTime focusDay) {
    selectedDay.value = day;
    focusedDay.value = focusDay;
  }

  void addEvent(String eventName, String eventDescription) {
    if (eventName.isNotEmpty && eventDescription.isNotEmpty) {
      events.update(
        selectedDay.value,
        (existingEvents) => [
          ...existingEvents,
          {"name": eventName, "description": eventDescription}
        ],
        ifAbsent: () => [
          {"name": eventName, "description": eventDescription}
        ],
      );
      update(); // Notify UI to rebuild
    }
  }
}