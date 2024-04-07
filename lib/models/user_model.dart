class UserModel {
  int? id;
  String? name;
  String? role;
  String? username;
  String? email;
  int? balance;
  String? profilePhotoUrl;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.role,
    this.username,
    this.email,
    this.balance,
    this.profilePhotoUrl,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        role: json["role"],
        username: json["username"],
        email: json["email"],
        balance: json["balance"],
        profilePhotoUrl: json["profile_photo_url"],
        token: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
        "username": username,
        "email": email,
        "balance": balance,
        "profile_photo_url": profilePhotoUrl,
        "access_token": token,
      };
}
