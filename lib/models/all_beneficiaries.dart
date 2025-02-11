class AllBeneficiariesModel {
  final dynamic id;
  final String? fullname;
  final String? image;

  AllBeneficiariesModel({
    this.id,
    this.fullname,
    this.image,
  });

  factory AllBeneficiariesModel.fromJson(Map<String, dynamic> json) =>
      AllBeneficiariesModel(
        id: json["id"],
        fullname: json["fullname"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "image": image,
      };
}
