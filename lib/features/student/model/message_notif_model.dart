//Student ScreenItem model
import 'package:intl/intl.dart';

class MessageNotifModel {
  DateTime dateTime;
  String title;
  String content;
  String receiveStatus;
  bool receiveStatusFirst;
  // Constructor
  MessageNotifModel(
      {required this.dateTime,
      required this.title,
      required this.content,
      this.receiveStatus = "",
      this.receiveStatusFirst = false});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['content'] = content;
    data['dateTime'] = dateTime;
    return data;
  }

  //Convert json to Model
  factory MessageNotifModel.fromJson(Map<String, dynamic> data) {
    return MessageNotifModel(
      title: data["title"] ?? "",
      content: data["content"] ?? "",
      dateTime: data["dateTime"] ?? DateTime.now(),
      receiveStatus: data['receiveStatus'] ?? "",
      receiveStatusFirst: data['receiveStatusFirst'] ?? false,
    );
  }

  static List<Map<String, dynamic>> getUpdatedMessageList(
      {required List<dynamic> messageNotifList}) {
    List<Map<String, dynamic>> updatedMessageList = [];

    for (var element in messageNotifList) {
        updatedMessageList.add(element as Map<String, dynamic>);
      }
    updatedMessageList = updatedMessageList.map((element) => element).toList()
      ..sort((a, b) => b["dateTime"].compareTo(a["dateTime"]));
    for (var element in updatedMessageList) {
      String date = DateFormat('dd-MM-yyyy').format(element["dateTime"]);
      String todayDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
      String yesterdayDate = DateFormat('dd-MM-yyyy')
          .format(DateTime.now().subtract(const Duration(days: 1)));
      if (date == todayDate) {
        element["receiveStatus"] = "Today";
      } else if (date == yesterdayDate) {
        element["receiveStatus"] = "Yesterday";
      } else {
        element["receiveStatus"] = "Old";
      }
    }
    for (int i = 0; i < updatedMessageList.length; i++) {
      if (i == 0) {
        updatedMessageList[i]["receiveStatusFirst"] = true;
      } else if (updatedMessageList[i]["receiveStatus"] !=
          updatedMessageList[i - 1]["receiveStatus"]) {
        updatedMessageList[i]["receiveStatusFirst"] = true;
      } else {
        updatedMessageList[i]["receiveStatusFirst"] = false;
      }
    }
    return updatedMessageList;
  }
}
