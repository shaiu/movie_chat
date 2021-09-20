class User {
  final String? id;
  final String email;
  final String username;

  const User({this.id, required this.email, required this.username});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'username': username,
    };
  }
}
