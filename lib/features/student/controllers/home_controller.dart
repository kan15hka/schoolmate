import 'package:get/get.dart';
import 'package:schoolmate/common/widgets/loaders/loaders.dart';
import 'package:schoolmate/dummy.dart';
import 'package:schoolmate/features/pages/screens/alerts/alerts.dart';
import 'package:schoolmate/features/pages/screens/attendance/attendance.dart';
import 'package:schoolmate/features/pages/screens/exams/exams.dart';
import 'package:schoolmate/features/pages/screens/homework/homework.dart';
import 'package:schoolmate/features/pages/screens/result/result.dart';
import 'package:schoolmate/features/pages/screens/subjects/subjects.dart';
import 'package:schoolmate/features/pages/screens/timetable/time_table.dart';
import 'package:schoolmate/features/student/model/page_item_model.dart';
import 'package:schoolmate/utils/helpers/network_manager.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  //Variables
  final banners = [1, 2, 3, 4, 5];
  //student pageitems
  @override
  onInit() {
    super.onInit();
    checkNetworkConnectivity();
  }

  checkNetworkConnectivity() async {
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TLoaders.warningSnackBar(
          title: 'No Internet Connection',
          message:
              "You are not connected to the network. Please get connected to proceed.");
      return;
    }
  }

  List<PageItemModel> homePageItems = [
    PageItemModel(
      title: "Subjects",
      iconUrl: "assets/images/subjects.png",
      widget: const SubjetcsPage(),
    ),
    PageItemModel(
      title: "Home Work",
      iconUrl: "assets/images/homework.png",
      widget: const HomeWorkPage(),
    ),
    PageItemModel(
      title: "Alerts",
      iconUrl: "assets/images/notifications.png",
      widget: const AlertsPage(),
    ),
    PageItemModel(
      title: "Exams",
      iconUrl: "assets/images/test.png",
      widget: const ExamsPage(),
    ),
    PageItemModel(
      title: "Time Table",
      iconUrl: "assets/images/timetable.png",
      widget: const TimeTablePage(),
    ),
    PageItemModel(
      title: "Attendance",
      iconUrl: "assets/images/attendance.png",
      widget: const AttendancePage(),
    ),
    PageItemModel(
      title: "Result",
      iconUrl: "assets/images/result.png",
      widget: const ResultPage(),
    ),
    PageItemModel(
      title: "Awards",
      iconUrl: "assets/images/awards.png",
      widget: const Dummy(),
    ),
  ];
}
