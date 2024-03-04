import 'package:schoolmate/features/pages/models/attendance_model.dart';

import 'package:get/get.dart';
import 'package:schoolmate/features/student/model/calender_events_model.dart';
import 'package:schoolmate/utils/http/http_client.dart';

List<AttendanceModel> attendanceList = [
  AttendanceModel(
    date: DateTime.now().subtract(Duration(days: 2)),
    isPresent: false,
  ),
  AttendanceModel(
    date: DateTime.now().subtract(Duration(days: 1)),
    isPresent: true,
  ),
  AttendanceModel(
    date: DateTime.now(),
    isPresent: false,
  ),
  AttendanceModel(
    date: DateTime.now().add(Duration(days: 2)),
    isPresent: true,
  ),
  AttendanceModel(
    date: DateTime.now().add(Duration(days: 3)),
    isPresent: true,
  )
];

class AttendanceRepository extends GetxController {
  static AttendanceRepository get instance => Get.find();

  //Fetch User details based on user id
  Future<List<AttendanceModel>> fetchAttendance() async {
    // final response = await SHttpHelper.post("view_event", {});

    // List<dynamic> events = response['events'];
    // List<CalendarEventsModel> eventModelList = [];
    // for (Map<String, dynamic> event in events) {
    //   CalendarEventsModel calenderModel = CalendarEventsModel.fromJson(event);
    //   eventModelList.add(calenderModel);
    // }
    return attendanceList;
  }
}
