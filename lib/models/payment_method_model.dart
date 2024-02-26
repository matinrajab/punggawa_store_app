class PaymentMethodModel {
  int? id;
  String? name;

  PaymentMethodModel({
    this.id,
    this.name,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) => PaymentMethodModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}