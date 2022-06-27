import 'package:hearooz/models/user%20profile/current_profile.dart';
import 'package:hearooz/models/user%20profile/refresh_token.dart';
import 'package:hearooz/models/user%20profile/user.dart';

class UserProfile {
  late CurrentProfile currentProfile;
  late RefreshToken refreshToken;
  late String sessionId;
  late User user;

  UserProfile({
    required this.currentProfile,
    required this.refreshToken,
    required this.sessionId,
    required this.user,
  });

  UserProfile.fromMap(Map<String, dynamic> map) {
    currentProfile = CurrentProfile.fromMap(map["current_profile"]);
    refreshToken = RefreshToken.fromMap(map["refresh_token"]);
    sessionId = map["session_id"];
    user = User.fromMap(map["user"]);
  }
}
