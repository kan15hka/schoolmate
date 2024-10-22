import 'package:get/get.dart';
import 'package:schoolmate/data/repositories/teacher_repository.dart';
import 'package:schoolmate/features/student/model/teacher_model.dart';

class TeacherController extends GetxController {
  static TeacherController get instance => Get.find();

  //variables
  RxBool isLoading = false.obs;
  final teacherRepository = Get.put(TeacherRepository());
  RxList<TeacherModel> teachers = <TeacherModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    try {
      isLoading.value = true;
      final teachers = await teacherRepository.fetchTeacherDetails();

      this.teachers(teachers);

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }
}
