class User {
  final int id;
  final String name;
  final String email;
  final String password;

  User({
    this.id = 0,
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "email": email, "password": password};
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      password: json["password"],
    );
  }
}
