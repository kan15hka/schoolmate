class StudentModel {
  String id;
  String name;
  String rollNo;
  String standard;
  String sectionId;
  String section;
  String bloodGroup;
  String fatherName;
  String motherName;
  String dob;
  String gaurdianName;
  String gender;
  String image;
  String emisNo;
  String address;
  String phone1;
  String phone2;
  String isHosteller;
  String email;
  StudentModel(
      {required this.id,
      required this.isHosteller,
      required this.rollNo,
      required this.name,
      required this.standard,
      required this.bloodGroup,
      required this.dob,
      required this.section,
      required this.sectionId,
      required this.fatherName,
      required this.motherName, //
      required this.gaurdianName, //
      required this.address,
      required this.emisNo,
      required this.phone1,
      required this.phone2,
      required this.gender,
      required this.email, //
      required this.image});

  static StudentModel empty() => StudentModel(
      id: "",
      name: "",
      rollNo: "",
      dob: "",
      standard: "",
      bloodGroup: "",
      section: "",
      sectionId: "",
      fatherName: "",
      motherName: "",
      gaurdianName: "",
      address: "",
      emisNo: "",
      phone1: "",
      phone2: "",
      gender: "",
      email: "",
      image: "",
      isHosteller: "");
  //Convert json to Model
  factory StudentModel.fromJson(Map<String, dynamic> data) {
    return StudentModel(
      id: data["s_id"] ?? "",
      name: data["s_name"] ?? "",
      rollNo: data["roll_no"] ?? "",
      dob: data["dob"] ?? "",
      isHosteller: data["hosteller"] ?? "false",
      image: data["img"] ?? "",
      standard: data["standard"] ?? "",
      section: data["section_name"] ?? "",
      sectionId: data["section_id"] ?? "",
      bloodGroup: data["blood_group"] ?? "",
      address: data["address"] ?? "",
      fatherName: data["father_name"] ?? "",
      motherName: data["mother_name"] ?? "",
      gaurdianName: data["gaurdian_name"] ?? "",
      email: data["email"] ?? "",
      emisNo: data["emis_no"] ?? "",
      phone1: data["phone_no_1"] ?? "",
      phone2: data["phone_no_2"] ?? "",
      gender: data["gender"] ?? "",
    );
  }
}
