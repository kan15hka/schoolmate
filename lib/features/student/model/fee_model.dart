class FeeModel {
  String title;
  String amount;
  DateTime dueDate;
  String paymentMode;
  bool isPaid;
  bool isFirst;

  FeeModel({
    required this.title,
    required this.amount,
    required this.dueDate,
    required this.paymentMode,
    required this.isPaid,
    this.isFirst = false,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['amount'] = amount;
    data['dueDate'] = dueDate;
    data['paymentMode'] = paymentMode;
    data['isPaid'] = isPaid;
    return data;
  }

  //Convert json to Model
  factory FeeModel.fromJson(Map<String, dynamic> data) {
    return FeeModel(
      title: data["title"] ?? "",
      amount: data["amount"] ?? "",
      dueDate: data["dueDate"] ?? DateTime.now(),
      paymentMode: data['paymentMode'] ?? "",
      isPaid: data['isPaid'] ?? false,
      isFirst: data['isFirst'] ?? false,
    );
  }
}
