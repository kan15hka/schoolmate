import 'package:get/get.dart';
import 'package:schoolmate/common/widgets/loaders/loaders.dart';
import 'package:schoolmate/data/repositories/circular_repository.dart';
import 'package:schoolmate/features/student/model/message_notif_model.dart';

class CircularController extends GetxController {
  static CircularController get instance => Get.find();

  //Variables
  RxList<MessageNotifModel> circulars = <MessageNotifModel>[].obs;
  final isLoading = false.obs;
  final circularRepository = Get.put(CircularRepository());

  @override
  onInit() {
    super.onInit();
    fetchCirculars();
  }

  Future<void> fetchCirculars() async {
    try {
      isLoading.value = true;

      //Fetch eventsdata fromapi
      final circulars = await circularRepository.fetchCirculars();
      this.circulars(circulars);

      isLoading.value = false;
    } catch (e) {
      circulars([]);
      TLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Someting went wrong. Please try again");
    }
  }
}
