class AddressApiModel {
  String? id;
  String? text;

  AddressApiModel({
    this.id,
    this.text,
  });

  factory AddressApiModel.fromJson(Map<String, dynamic> json) => AddressApiModel(
    id: json["id"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
  };
}