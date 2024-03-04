class CalendarEventsModel {
  DateTime date;
  String event;
  String status;
  CalendarEventsModel({
    required this.date,
    required this.event,
    required this.status,
  });

  //Empty getter
  static CalendarEventsModel empty() =>
      CalendarEventsModel(date: DateTime.now(), event: "", status: "");

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date.toString();
    data['status'] = status;
    data['event'] = event;
    return data;
  }

  //Convert json to Model
  factory CalendarEventsModel.fromJson(Map<String, dynamic> data) {
    DateTime date = DateTime.parse(data["date"]);
    return CalendarEventsModel(
      date: date,
      event: data["event"] ?? "",
      status: data["status"] ?? "",
    );
  }
}
