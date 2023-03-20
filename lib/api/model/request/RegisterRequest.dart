/// name : "Ahmed Abd Al-Muti"
/// email : "nabil1@route.com"
/// password : "123456"
/// repassword : "123456"
/// phone : "01234567801"

class RegisterRequest {
  RegisterRequest({
    this.name,
    this.email,
    this.password,
    this.repassword,
    this.phone,
  });

  RegisterRequest.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    repassword = json['repassword'];
    phone = json['phone'];
  }

  String? name;
  String? email;
  String? password;
  String? repassword;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['repassword'] = repassword;
    map['phone'] = phone;
    return map;
  }
}
