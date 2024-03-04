import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmate/common/widgets/loaders/loaders.dart';
import 'package:schoolmate/data/repositories/attendance_repository.dart';
import 'package:schoolmate/data/repositories/calendar_repository.dart';
import 'package:schoolmate/features/pages/models/attendance_model.dart';
import 'package:schoolmate/features/student/model/calender_events_model.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/formatters/formatter.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceController extends GetxController {
  static AttendanceController get instance => Get.find();

  //Variables
  Rx<Color> selectedColor = SColors.primary.obs;
  Rx<bool> onEventSelected = false.obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime> selectedDay = DateTime.now().obs;
  RxList<AttendanceModel> events = <AttendanceModel>[].obs;
  RxInt overallWorkingDays = 0.obs;
  RxInt overallPresentDays = 0.obs;

  Map<String, List<AttendanceModel>> eventsMap = {};

  final isLoading = false.obs;
  final attendanceRepository = Get.put(AttendanceRepository());

  @override
  onInit() {
    super.onInit();
    fetchAttendance();
    selectedDay = focusedDay;
  }

  Future<void> fetchAttendance() async {
    try {
      isLoading.value = true;

      //Fetch eventsdata fromapi
      final events = await attendanceRepository.fetchAttendance();
      this.events(events);

      //for get eventsday func
      for (AttendanceModel element in events) {
        eventsMap.addAll({
          SFormatter.formatDate((element.date)): [element]
        });
      }
      //Calculate pie info
      for (AttendanceModel day in events) {
        overallWorkingDays.value++;
        if (day.isPresent) {
          overallPresentDays.value++;
        }
      }

      isLoading.value = false;
    } catch (e) {
      events([]);
      TLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Someting went wrong. Please try again");
    }
  }

  //Events
  List<AttendanceModel> getEventsDay(DateTime day) {
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
    if (eventsMap[SFormatter.formatDate(selectedDay)] == null) {
      selectedColor.value = SColors.primary;
    } else {
      final isPresent =
          (eventsMap[SFormatter.formatDate(selectedDay)])![0].isPresent;
      selectedColor.value = isPresent ? SColors.present : SColors.absent;
    }
  }

  Widget markerBuilder(BuildContext context, date, event) {
    if (event.isEmpty) return const SizedBox();
    Color markerColor = (event as List<AttendanceModel>)[0].isPresent
        ? SColors.present
        : SColors.absent;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(1),
      child: Container(
        // height: 7,
        width: 6,
        decoration: BoxDecoration(shape: BoxShape.circle, color: markerColor),
      ),
    );
  }
}
