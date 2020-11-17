class UserModel {
  String UserName;
  String Password;
  String BarcodeNumber;

  UserModel({
    this.UserName,
    this.Password,
    this.BarcodeNumber,
  });
  UserModel copyWith({UserName, Password, BarcodeNumber}) {
    return UserModel(
      UserName: UserName ?? this.UserName,
      Password: Password ?? this.Password,
      BarcodeNumber: BarcodeNumber ?? this.BarcodeNumber,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      UserName: json['UserName'],
      Password: json['Password'],
      BarcodeNumber: json['BarcodeNumber'],
    );
  }

  Map<String, dynamic> toJson() => {
        "UserName": UserName,
        "Password": Password,
        "BarcodeNumber": BarcodeNumber,
      };
}
