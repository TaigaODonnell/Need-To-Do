class AppUser {
  final String name;
  final String email;
  final String password;
  final String uid;

  AppUser(
      {required this.name,
      required this.email,
      required this.password,
      required this.uid});

  factory AppUser.fromFirestore(Map<String, dynamic> data) {
    return AppUser(
      name: data['name'] ?? "",
      email: data['email'] ?? "",
      password: data['password'] ?? "",
      uid: data['uid'] ?? "",
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'uid': uid,
    };
  }
}
