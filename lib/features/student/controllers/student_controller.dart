import 'package:get/get.dart';
import 'package:schoolmate/common/widgets/loaders/loaders.dart';
import 'package:schoolmate/data/repositories/student_repository.dart';
import 'package:schoolmate/features/student/model/student_model.dart';

class StudentController extends GetxController {
  static StudentController get instance => Get.find();

  //variables
  final isLoading = false.obs;
  final studentRepository = Get.put(StudentRepository());
  Rx<StudentModel> student = StudentModel.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    try {
      isLoading.value = true;
      final student = await studentRepository.fetchUserDetails();
      this.student(student);

      isLoading.value = false;
    } catch (e) {
      student(StudentModel.empty());
      TLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Someting went wrong. Please try again");
    }
  }
}
