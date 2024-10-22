import 'package:get/get.dart';
import 'package:schoolmate/common/widgets/loaders/loaders.dart';
import 'package:schoolmate/data/repositories/alerts_repository.dart';
import 'package:schoolmate/features/student/model/message_notif_model.dart';

class AlertsController extends GetxController {
  static AlertsController get instance => Get.find();

  //Variables
  RxList<MessageNotifModel> alerts = <MessageNotifModel>[].obs;
  final isLoading = false.obs;
  final alertsRepository = Get.put(AlertsRepository());

  @override
  onInit() {
    super.onInit();
    fetchAlerts();
  }

  Future<void> fetchAlerts() async {
    try {
      isLoading.value = true;

      //Fetch eventsdata fromapi
      final alerts = await alertsRepository.fetchAlerts();
      this.alerts(alerts);

      isLoading.value = false;
    } catch (e) {
      alerts([]);
      TLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Someting went wrong. Please try again");
    }
  }
}
