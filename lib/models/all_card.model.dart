class AllCardsModel {
  final dynamic id;
  final String? cardNumber;
  final String? cardType;
  final dynamic balance;
  final String? name;
  final String? bankName;
  final String? expiryDate;

  AllCardsModel({
    this.id,
    this.cardNumber,
    this.cardType,
    this.balance,
    this.name,
    this.bankName,
    this.expiryDate,
  });

  factory AllCardsModel.fromJson(Map<String, dynamic> json) => AllCardsModel(
        id: json["id"],
        cardNumber: json["card_number"],
        cardType: json["card_type"],
        balance: json["balance"],
        name: json["name"],
        bankName: json["bank_name"],
        expiryDate: json["expiry_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "card_number": cardNumber,
        "card_type": cardType,
        "balance": balance,
        "name": name,
        "bank_name": bankName,
        "expiry_date": expiryDate,
      };
}
