class CurrentProfile {
  late var favorites;
  late var history;
  late String id;
  late String name;
  late int version;

  CurrentProfile({
    this.favorites,
    this.history,
    required this.id,
    required this.name,
    required this.version,
  });

  CurrentProfile.fromMap(Map<String, dynamic> map) {
    favorites = map["favorites"];
    history = map["history"];
    id = map["id"];
    name = map["name"];
    version = map["version"];
  }
}
