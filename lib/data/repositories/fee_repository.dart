import 'package:get/get.dart';
import 'package:schoolmate/features/student/model/fee_model.dart';

List<dynamic> feeList = [
  {
    "title": "Semester II",
    'amount': "75000",
    'dueDate': DateTime.now(),
    'paymentMode': "Offline",
    'isPaid': true
  },
  {
    'title': "Semester III",
    'amount': "50000",
    'dueDate': DateTime.now(),
    'paymentMode': "Offline",
    'isPaid': false
  },
  {
    'title': "Semester II",
    'amount': "75000",
    'dueDate': DateTime.now(),
    'paymentMode': "Offline",
    'isPaid': true
  },
  {
    'title': "Semester I",
    'amount': "30000",
    'dueDate': DateTime.now(),
    'paymentMode': "Offline",
    'isPaid': true
  },
];

class FeeRepository extends GetxController {
  static FeeRepository get instance => Get.find();

  //Fetch User details based on user id
  Future<List<FeeModel>> fetchFees() async {
    // final response = await SHttpHelper.post("view_event", {});

    //List<dynamic> events = response['events'];
    List<dynamic> fees = feeList;
    List<FeeModel> feeModelList = [];

    //Program to sort list andadd isfirst
    List<Map<String, dynamic>> dummy = [];
    List<Map<String, dynamic>> feeDummyList = [];

    for (Map<String, dynamic> element in fees) {
      if (element["isPaid"] == false) {
        feeDummyList.add(element);
      } else {
        dummy.add(element);
      }
    }
    feeDummyList = [...feeDummyList, ...dummy];
    //Find the First element
    String check = "null";
    for (Map<String, dynamic> element in feeDummyList) {
      if (element["isPaid"].toString() != check) {
        check = element["isPaid"].toString();
        element["isFirst"] = true;
      } else {
        element["isFirst"] = false;
      }
    }
    for (Map<String, dynamic> fee in feeDummyList) {
      FeeModel calenderModel = FeeModel.fromJson(fee);
      feeModelList.add(calenderModel);
    }
    return feeModelList;
  }
}
