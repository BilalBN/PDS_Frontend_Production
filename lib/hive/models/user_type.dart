class UserType {
  int id;
  String? email;
  String? phone;
  String role;
  String userName;

  UserType(this.id, this.email, this.phone, this.role, this.userName);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'role': role,
      'user_name': userName,
    };
  }
}
