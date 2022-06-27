import 'package:hearooz/models/user%20profile/profile.dart';

class User {
  late String email;
  late String id;
  late String kind;
  late List<Profile>? profiles;

  User({
    required this.email,
    required this.id,
    required this.kind,
    this.profiles,
  });

  User.fromMap(Map<String, dynamic> map) {
    email = map["email"];
    id = map["id"];
    kind = map["kind"];
    profiles = list(map["profiles"] ?? []);
  }

  List<Profile> list(List<dynamic>? list) {
    List<Profile> ans = [];
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        ans.add(Profile.fromMap(list[i]));
      }
    }
    return ans;
  }
}
