import 'package:get/get.dart';
import 'package:schoolmate/common/widgets/loaders/loaders.dart';
import 'package:schoolmate/data/repositories/fee_repository.dart';
import 'package:schoolmate/features/student/model/fee_model.dart';

class FeesController extends GetxController {
  static FeesController get instance => Get.find();

  //Variables
  RxList<FeeModel> fees = <FeeModel>[].obs;
  final isLoading = false.obs;
  final feesRepository = Get.put(FeeRepository());

  @override
  onInit() {
    super.onInit();
    fetchFees();
  }

  Future<void> fetchFees() async {
    try {
      isLoading.value = true;

      //Fetch data from api
      final fees = await feesRepository.fetchFees();
      this.fees(fees);

      isLoading.value = false;
    } catch (e) {
      fees([]);
      TLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Someting went wrong. Please try again");
    }
  }
}
