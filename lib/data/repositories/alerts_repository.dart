import 'package:get/get.dart';
import 'package:schoolmate/features/student/model/message_notif_model.dart';

class AlertsRepository extends GetxController {
  static AlertsRepository get instance => Get.find();

  Future<List<MessageNotifModel>> fetchAlerts() async {
    // final response = await SHttpHelper.post("view_event", {});

    //List<dynamic> events = response['events'];
    List<MessageNotifModel> alertsModelList = [];
    List<dynamic> alerts = alertsList;
    List<Map<String, dynamic>> alertsDummyList =
        MessageNotifModel.getUpdatedMessageList(messageNotifList: alerts);
    for (Map<String, dynamic> alert in alertsDummyList) {
      MessageNotifModel alertModel = MessageNotifModel.fromJson(alert);
      alertsModelList.add(alertModel);
    }
    return alertsModelList;
  }
}

List<dynamic> alertsList = [
  {
    'dateTime':
        DateTime.now().subtract(const Duration(days: 2, hours: 8, minutes: 35)),
    'title': "Exam Alert",
    'content':
        "Upcoming exams: [Date] to [Date]. Prepare well! Your success begins with focused preparation. Best of luck!",
  },
  {
    'dateTime': DateTime.now(),
    'title': "Sports Day Notice",
    'content':
        "Mark your calendars! Sports Day on [Date]. Join us for a day filled with fun, games, and excitement. See you there!",
  },
  {
    'dateTime': DateTime.now(),
    'title': "Exhibit Your Skills",
    'content':
        "Unleash your creativity at the Science Fair on [Date]. Showcase your talents and explore the wonders of science. Excitement awaits!",
  },
  {
    'dateTime':
        DateTime.now().subtract(const Duration(days: 1, hours: 1, minutes: 8)),
    'title': " Help Needed",
    'content':
        "Be a part of [Event]. Your support is invaluable. Volunteer now to make a difference! Together, we can create memorable experiences.!",
  },
  {
    'dateTime':
        DateTime.now().subtract(const Duration(days: 1, hours: 8, minutes: 35)),
    'title': "Exam Alert",
    'content':
        "Upcoming exams: [Date] to [Date]. Prepare well! Your success begins with focused preparation. Best of luck!",
  },
];
