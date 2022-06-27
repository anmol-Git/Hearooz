class Profile {
  late String id;
  late String name;
  late String version;

  Profile({
    required this.id,
    required this.name,
    required this.version,
  });

  Profile.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    version = map["version"];
  }
}
