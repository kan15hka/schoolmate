import 'package:get/get.dart';
import 'package:schoolmate/features/student/model/teacher_model.dart';
import 'package:schoolmate/utils/http/http_client.dart';

class TeacherRepository extends GetxController {
  static TeacherRepository get instance => Get.find();

  //Fetch User details based on user id
  Future<List<TeacherModel>> fetchTeacherDetails() async {
    List<TeacherModel> teachers = [];

    final response = await SHttpHelper.post("view_teacher", {});

    for (Map<String, dynamic> teacher in response["message"]) {
      teachers.add(TeacherModel.fromJson(teacher));
    }
    return teachers;
  }
}
