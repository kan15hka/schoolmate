class ExamModel {
  String examTitle;
  List<ExamSubjectsModel> examsList;
  ExamModel({
    required this.examTitle,
    required this.examsList,
  });

  //To Json Function
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['examTitle'] = examTitle;
    List<Map<String, dynamic>> jsonEventsList = [];
    for (ExamSubjectsModel element in examsList) {
      jsonEventsList.add(element.toJson());
    }
    data['examsList'] = jsonEventsList;
    return data;
  }
}

class ExamSubjectsModel {
  String subjectName;
  String subjectCode;

  String subjectTeacher;

  DateTime examDateTime;
  String syllabus;
  ExamSubjectsModel({
    required this.subjectName,
    required this.examDateTime,
    required this.syllabus,
    required this.subjectCode,
    required this.subjectTeacher,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subjectName'] = subjectName;
    data['examDateTime'] = examDateTime;
    data['syllabus'] = syllabus;
    data['subjectCode'] = subjectCode;
    data['subjectTeacher'] = subjectTeacher;
    return data;
  }
}
