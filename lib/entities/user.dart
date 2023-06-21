// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String id;
  final String username;
  final String email;
  final String password;
  final bool validated;
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.validated,
  });
  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, pass: $password, validated: $validated)';
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'validated': validated
    };
  }

  factory User.fromMap(Map<String, dynamic> mapa) {
    return User(
        email: mapa['email'],
        id: mapa['id'].toString(),
        username: mapa['username'],
        password: mapa['password'],
        validated: true);
  }
}
