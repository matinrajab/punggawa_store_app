class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  String? profilePhotoUrl;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.profilePhotoUrl,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        profilePhotoUrl: json["profile_photo_url"],
        token: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "profile_photo_url": profilePhotoUrl,
        "access_token": token,
      };
}
