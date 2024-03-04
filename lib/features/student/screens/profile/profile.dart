import 'package:flutter/material.dart';
import 'package:schoolmate/features/student/screens/profile/widgets/profile_appbar.dart';
import 'package:schoolmate/features/student/screens/profile/widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          //App Bar
          SProfileAppBar(),
          //Profile View
          SProfileCard(),
          SizedBox(
            height: 100.0,
          )
        ]),
      ),
    );
  }
}
