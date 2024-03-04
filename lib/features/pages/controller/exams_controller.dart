import 'package:get/get.dart';
import 'package:schoolmate/common/widgets/loaders/loaders.dart';
import 'package:schoolmate/data/repositories/exams_repository.dart';
import 'package:schoolmate/features/pages/models/exams_model.dart';

class ExamsController extends GetxController {
  static ExamsController get instance => Get.find();

  //Variables
  RxList<Map<String, dynamic>> examsJsonList = <Map<String, dynamic>>[].obs;
  RxList<ExamModel> exams = <ExamModel>[].obs;
  RxBool isLoading = false.obs;
  final examsRepository = Get.put(ExamsRepository());

  @override
  void onInit() {
    fetchExams();
    super.onInit();
  }

  Future<void> fetchExams() async {
    try {
      isLoading.value = true;

      //Fetch eventsdata fromapi
      final exams = await examsRepository.fetchExams();
      this.exams(exams);

      examsJsonList.value = getExamsInfo();

      isLoading.value = false;
    } catch (e) {
      exams([]);
      TLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Someting went wrong. Please try again");
    }
  }

  List<Map<String, dynamic>> getExamsInfo() {
    List<Map<String, dynamic>> examsJsonList = [];
    for (ExamModel exam in examList) {
      List<Map<String, dynamic>> subjectList = [];
      for (ExamSubjectsModel examSubject in exam.examsList) {
        subjectList.add(examSubject.toJson());
      }
      subjectList.sort(
        (a, b) {
          DateTime aDate = (a["examDateTime"]);
          DateTime bDate = (b["examDateTime"]);
          return aDate.compareTo(bDate);
        },
      );
      DateTime startDate = subjectList[0]["examDateTime"];
      DateTime endDate = subjectList[subjectList.length - 1]["examDateTime"];
      String examStatus = "none";
      if (endDate.isBefore(DateTime.now())) {
        examStatus = "Completed Exams";
      } else {
        examStatus = "Upcoming Exams";
      }
      examsJsonList.add({
        "examTitle": exam.examTitle,
        "subjectList": subjectList,
        "startDate": startDate,
        "endDate": endDate,
        "examStatus": examStatus,
      });
    }

    examsJsonList.sort(
      (a, b) {
        DateTime aDate = (a["endDate"]);
        DateTime bDate = (b["endDate"]);
        return bDate.compareTo(aDate);
      },
    );
    String dummy = "dummy";
    for (Map<String, dynamic> element in examsJsonList) {
      if (element["examStatus"] != dummy) {
        element.addAll({"isFirst": true});
        dummy = element["examStatus"];
      } else {
        element.addAll({"isFirst": false});
      }
    }
    return examsJsonList;
  }
}
