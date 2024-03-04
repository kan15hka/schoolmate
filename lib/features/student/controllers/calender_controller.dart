import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmate/common/widgets/loaders/loaders.dart';
import 'package:schoolmate/data/repositories/calendar_repository.dart';
import 'package:schoolmate/features/student/model/calender_events_model.dart';
import 'package:schoolmate/utils/formatters/formatter.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderController extends GetxController {
  static CalenderController get instance => Get.find();

  //Variables
  Rx<Color> markerColor = Colors.black.obs;
  Rx<bool> onEventSelected = false.obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime> selectedDay = DateTime.now().obs;
  RxList<CalendarEventsModel> events = <CalendarEventsModel>[].obs;
  RxList<CalendarEventsModel> selectedDayEvents = <CalendarEventsModel>[].obs;

  Map<String, List<Map<String, dynamic>>> eventsMap = {};

  final isLoading = false.obs;
  final calendarRepository = Get.put(CalenderRepository());

  @override
  onInit() {
    super.onInit();
    fetchCalenderEvents();
    selectedDay = focusedDay;
  }

  Future<void> fetchCalenderEvents() async {
    try {
      isLoading.value = true;

      //Fetch eventsdata fromapi
      final events = await calendarRepository.fetchCalendarEvents();
      this.events(events);

      //for get eventsday func
      for (CalendarEventsModel element in events) {
        eventsMap.addAll({
          SFormatter.formatDate((element.date)): [
            {"date": element.event, "status": element.status}
          ]
        });
      }

      isLoading.value = false;
    } catch (e) {
      events([]);
      TLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Someting went wrong. Please try again");
    }
  }

  //Events
  List<Map<String, dynamic>> getEventsDay(DateTime day) {
    String formatDate = SFormatter.formatDate(day);
    return eventsMap[formatDate] ?? [];
  }

  void onDaySelected(selectedDay, focusedDay) {
    if (!isSameDay(selectedDay, this.selectedDay.value)) {
      //Evenet selected bool
      onEventSelected.value = false;
      this.selectedDay.value = selectedDay;
      this.focusedDay.value = focusedDay;
    }

    for (CalendarEventsModel calEvent in events) {
      if (isSameDay(calEvent.date, selectedDay)) {
        selectedDayEvents.clear();
        selectedDayEvents.add(calEvent);
        onEventSelected.value = true;
      }
    }
  }
}
