class CurrentUser {
  late String id;
  late String kind;

  CurrentUser({
    required this.id,
    required this.kind,
  });

  CurrentUser.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    kind = map["kind"];
  }
}
