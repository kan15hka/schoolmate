import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schoolmate/common/widgets/texts/section_heading.dart';
import 'package:schoolmate/features/student/model/student_model.dart';
import 'package:schoolmate/features/student/screens/profile/widgets/user_info_card.dart';
import 'package:schoolmate/utils/constants/sizes.dart';
import 'package:unicons/unicons.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({
    super.key,
    required this.user,
  });
  final StudentModel user;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Divider(
        thickness: 1.5,
        indent: 15.0,
        endIndent: 15.0,
        color: Color.fromARGB(14, 0, 0, 0),
      ),
      UserInfoCard(
          icon: MdiIcons.identifier,
          iconSize: 30.0,
          title: "Roll Number",
          content: user.rollNo),
      UserInfoCard(
          icon: MdiIcons.at,
          iconSize: 25.0,
          title: "Email",
          content: user.email),
      UserInfoCard(
          icon: UniconsLine.calender,
          iconSize: 25.0,
          title: "Residence Status",
          content: (user.isHosteller == "true") ? "Hosteller" : "Day Scholar"),
      UserInfoCard(
          icon: UniconsLine.calender,
          iconSize: 25.0,
          title: "Date of Birth",
          content: user.dob),
      UserInfoCard(
          icon: MdiIcons.human,
          iconSize: 25.0,
          title: "Gender",
          content: user.gender),
      UserInfoCard(
          icon: MdiIcons.water,
          iconSize: 25.0,
          title: "Blood Group",
          content: user.bloodGroup),
      const SSectionHeading(
        title: "Contact",
        padding: EdgeInsets.all(SSizes.sm),
      ),
      if (user.fatherName != "")
        UserInfoCard(
            icon: MdiIcons.humanMale,
            iconSize: 27.5,
            title: "Father",
            content: user.fatherName),
      if (user.motherName != "")
        UserInfoCard(
            icon: MdiIcons.humanFemale,
            iconSize: 27.5,
            title: "Mother",
            content: user.motherName),
      if (user.gaurdianName != "")
        UserInfoCard(
            icon: MdiIcons.human,
            iconSize: 27.5,
            title: "Gaurdian",
            content: user.gaurdianName),
      UserInfoCard(
          icon: MdiIcons.phone,
          title: "Phone Number",
          isCardSizeVariable: true,
          content: "${user.phone1}\n${user.phone2}"),
      UserInfoCard(
        icon: MdiIcons.mapMarker,
        iconSize: 25,
        title: "Address",
        content: user.address,
        isCardSizeVariable: true,
      ),
    ]);
  }
}
