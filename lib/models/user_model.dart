class UserModel {
  dynamic name;
  dynamic phone;
  dynamic password;
  dynamic email;
  dynamic image;
  dynamic uId;
  UserModel({
    this.email,
    this.image,
    this.name,
    this.password,
    this.phone,
    this.uId,
  });
  UserModel.fromjson(Map<String, dynamic> json) {
    name = json['name'];
    password = json['password'];
    image = json['image'];
    email = ['email'];
    phone = json['phone'];
    uId = json['uId'];
  }
  Map<String,dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'password': password,
      'image': image,
      'email': email,
      'uId': uId,
    };
  }
}
