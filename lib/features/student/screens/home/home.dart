import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmate/features/student/controllers/calender_controller.dart';
import 'package:schoolmate/features/student/controllers/circular_controller.dart';
import 'package:schoolmate/features/student/controllers/fee_controller.dart';
import 'package:schoolmate/features/student/controllers/home_controller.dart';
import 'package:schoolmate/features/student/controllers/student_controller.dart';
import 'package:schoolmate/features/student/controllers/teacher_controller.dart';
import 'package:schoolmate/features/student/screens/home/widgets/header_content.dart';
import 'package:schoolmate/features/student/screens/home/widgets/pages_gridview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final studentController = Get.put(StudentController());
    final teacherController = Get.put(TeacherController());
    final calendarController = Get.put(CalenderController());
    final feesController = Get.put(FeesController());
    final circularController = Get.put(CircularController());

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Header Content
              const SHeaderContent(),

              Container(
                color: Colors.white,
                child: const Column(
                  children: [
                    PagesGridview(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
