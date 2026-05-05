class AccountModel {
  int id;
  String? email;
  String? phone;
  String role;
  String userName;

  AccountModel(this.id, this.email, this.phone, this.role, this.userName);

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      json['id'],
      json['email'],
      json['phone'],
      json['role'],
      json['user_name'],
    );
  }
}
