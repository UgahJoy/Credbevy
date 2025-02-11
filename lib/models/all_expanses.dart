class AllExpensesModel {
  final String? month;
  final int? amountSpent;

  AllExpensesModel({
    this.month,
    this.amountSpent,
  });

  factory AllExpensesModel.fromJson(Map<String, dynamic> json) =>
      AllExpensesModel(
        month: json["month"],
        amountSpent: json["amount_spent"],
      );

  Map<String, dynamic> toJson() => {
        "month": month,
        "amount_spent": amountSpent,
      };
}
