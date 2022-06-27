class RefreshToken {
  late String token;
  late String type;

  RefreshToken({
    required this.token,
    required this.type,
  });

  RefreshToken.fromMap(Map<String, dynamic> map) {
    token = map["token"];
    type = map["type"];
  }
}
