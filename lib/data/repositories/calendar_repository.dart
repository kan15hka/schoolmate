
import 'package:get/get.dart';
import 'package:schoolmate/features/student/model/calender_events_model.dart';
import 'package:schoolmate/utils/http/http_client.dart';

class CalenderRepository extends GetxController {
  static CalenderRepository get instance => Get.find();

  //Fetch User details based on user id
  Future<List<CalendarEventsModel>> fetchCalendarEvents() async {
    final response = await SHttpHelper.post("view_event", {});

    List<dynamic> events = response['events'];
    List<CalendarEventsModel> eventModelList = [];
    for (Map<String, dynamic> event in events) {
      CalendarEventsModel calenderModel = CalendarEventsModel.fromJson(event);
      eventModelList.add(calenderModel);
    }
    return eventModelList;
  }
}
