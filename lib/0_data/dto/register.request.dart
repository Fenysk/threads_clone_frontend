class RegisterRequest {
  final String pseudo;
  final String email;
  final String password;

  RegisterRequest({
    required this.pseudo,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pseudo': pseudo,
      'email': email,
      'password': password,
    };
  }
}
