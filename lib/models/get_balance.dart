class BalanceModel {
  final String? data;
  BalanceModel({
    this.data,
  });

  factory BalanceModel.fromJson(Map<String, dynamic> json) => BalanceModel(
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };
}
