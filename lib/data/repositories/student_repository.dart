import 'package:get/get.dart';
import 'package:schoolmate/features/student/model/student_model.dart';
import 'package:schoolmate/utils/http/http_client.dart';

class StudentRepository extends GetxController {
  static StudentRepository get instance => Get.find();

  //Fetch User details based on user id
  Future<StudentModel> fetchUserDetails() async {
    final response =
        await SHttpHelper.post("view_studentfroms_id", {"s_id": "519Z-9TSf"});
    return StudentModel.fromJson(
        response["message"][0] as Map<String, dynamic>);
  }
}
