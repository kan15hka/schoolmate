import 'package:get/get.dart';
import 'package:schoolmate/features/pages/models/exams_model.dart';

const String _syllabus =
    "Calculus: Limits, derivatives, and integrals\nAlgebra: Polynomial equations, matrices, and determinants.\nGeometry: Analytical geometry, vectors, and three-dimensional geometry.\nProbability and Statistics: Probability distributions, hypothesis testing, and data analysis.\nTrigonometry: Trigonometric functions, identities, and applications in solving triangles.";

//const String _syllabus = "ddddd";
List<ExamModel> examList = [
  ExamModel(
    examTitle: "Annual Exam",
    examsList: [
      ExamSubjectsModel(
        subjectName: "Mathematics",
        examDateTime: DateTime.now().add(const Duration(days: 10)),
        syllabus: _syllabus,
        subjectCode: "SA4589",
        subjectTeacher: "Tyler Durden",
      ),
      ExamSubjectsModel(
        subjectName: "Science",
        examDateTime: DateTime.now().add(const Duration(days: 11)),
        syllabus: _syllabus,
        subjectCode: "SA4589",
        subjectTeacher: "Tyler Durden",
      ),
      ExamSubjectsModel(
        subjectName: "English",
        examDateTime: DateTime.now().add(const Duration(days: 12)),
        syllabus: _syllabus,
        subjectCode: "SA4589",
        subjectTeacher: "Tyler Durden",
      ),
      ExamSubjectsModel(
        subjectName: "Tamil",
        examDateTime: DateTime.now().add(const Duration(days: 13)),
        syllabus: _syllabus,
        subjectCode: "SA4589",
        subjectTeacher: "Tyler Durden",
      ),
      ExamSubjectsModel(
        subjectName: "Social Science",
        examDateTime: DateTime.now().add(const Duration(days: 14)),
        syllabus: _syllabus,
        subjectCode: "SA4589",
        subjectTeacher: "Tyler Durden",
      ),
    ],
  ),
  ExamModel(
    examTitle: "Half Early Exam",
    examsList: [
      ExamSubjectsModel(
        subjectName: "Mathematics",
        examDateTime: DateTime.now().subtract(const Duration(days: 12)),
        syllabus: _syllabus,
        subjectCode: "SA4589",
        subjectTeacher: "Tyler Durden",
      ),
      ExamSubjectsModel(
        subjectName: "Science",
        examDateTime: DateTime.now().subtract(const Duration(days: 11)),
        syllabus: _syllabus,
        subjectCode: "SA4589",
        subjectTeacher: "Tyler Durden",
      ),
      ExamSubjectsModel(
        subjectName: "English",
        examDateTime: DateTime.now().subtract(const Duration(days: 10)),
        syllabus: _syllabus,
        subjectCode: "SA4589",
        subjectTeacher: "Tyler Durden",
      ),
      ExamSubjectsModel(
        subjectName: "Tamil",
        examDateTime: DateTime.now().subtract(const Duration(days: 9)),
        syllabus: _syllabus,
        subjectCode: "SA4589",
        subjectTeacher: "Tyler Durden",
      ),
      ExamSubjectsModel(
        subjectName: "Social Science",
        examDateTime: DateTime.now().subtract(const Duration(days: 8)),
        syllabus: _syllabus,
        subjectCode: "SA4589",
        subjectTeacher: "Tyler Durden",
      ),
    ],
  ),
  ExamModel(
    examTitle: "Assessment I",
    examsList: [
      ExamSubjectsModel(
        subjectName: "Mathematics",
        examDateTime: DateTime.now().subtract(const Duration(days: 27)),
        syllabus: _syllabus,
        subjectCode: "SA4589",
        subjectTeacher: "Tyler Durden",
      ),
      ExamSubjectsModel(
        subjectName: "Science",
        examDateTime: DateTime.now().subtract(const Duration(days: 26)),
        syllabus: _syllabus,
        subjectCode: "SA4589",
        subjectTeacher: "Tyler Durden",
      ),
      ExamSubjectsModel(
        subjectName: "English",
        examDateTime: DateTime.now().subtract(const Duration(days: 25)),
        syllabus: _syllabus,
        subjectCode: "SA4589",
        subjectTeacher: "Tyler Durden",
      ),
      ExamSubjectsModel(
        subjectName: "Tamil",
        examDateTime: DateTime.now().subtract(const Duration(days: 24)),
        syllabus: _syllabus,
        subjectCode: "SA4589",
        subjectTeacher: "Tyler Durden",
      ),
      ExamSubjectsModel(
        subjectName: "Social Science",
        examDateTime: DateTime.now().subtract(const Duration(days: 23)),
        syllabus: _syllabus,
        subjectCode: "SA4589",
        subjectTeacher: "Tyler Durden",
      ),
    ],
  ),
  ExamModel(
    examTitle: "Assessment II",
    examsList: [
      ExamSubjectsModel(
        subjectName: "Mathematics",
        examDateTime: DateTime.now().subtract(const Duration(days: 2)),
        syllabus: _syllabus,
        subjectCode: "SA4589",
        subjectTeacher: "Tyler Durden",
      ),
      ExamSubjectsModel(
        subjectName: "Science",
        examDateTime: DateTime.now().subtract(const Duration(days: 1)),
        syllabus: _syllabus,
        subjectCode: "SA4589",
        subjectTeacher: "Tyler Durden",
      ),
      ExamSubjectsModel(
        subjectName: "English",
        examDateTime: DateTime.now(),
        syllabus: _syllabus,
        subjectCode: "SA4589",
        subjectTeacher: "Tyler Durden",
      ),
      ExamSubjectsModel(
        subjectName: "Tamil",
        examDateTime: DateTime.now().add(const Duration(days: 1)),
        syllabus: _syllabus,
        subjectCode: "SA4589",
        subjectTeacher: "Tyler Durden",
      ),
      ExamSubjectsModel(
        subjectName: "Social Science",
        examDateTime: DateTime.now().add(const Duration(days: 2)),
        syllabus: _syllabus,
        subjectCode: "SA4589",
        subjectTeacher: "Tyler Durden",
      ),
    ],
  ),
];

class ExamsRepository extends GetxController {
  static ExamsRepository get instance => Get.find();

  Future<List<ExamModel>> fetchExams() async {
    // final response = await SHttpHelper.post("view_event", {});

    //List<dynamic> events = response['events'];
    // List<MessageNotifModel> alertsModelList = [];
    // List<dynamic> alerts = alertsList;
    // List<Map<String, dynamic>> alertsDummyList =
    //     MessageNotifModel.getUpdatedMessageList(messageNotifList: alerts);
    // for (Map<String, dynamic> alert in alertsDummyList) {
    //   MessageNotifModel alertModel = MessageNotifModel.fromJson(alert);
    //   alertsModelList.add(alertModel);
    // }
    return examList;
  }
}
