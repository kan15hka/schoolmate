import 'package:get/get.dart';

class GraphController extends GetxController {
  static GraphController get instance => Get.find();

  //Variables

  RxList<int> showingTooltipOnSpots = <int>[0].obs;
}
