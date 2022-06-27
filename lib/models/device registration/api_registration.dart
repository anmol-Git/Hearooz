import 'package:hearooz/models/device%20registration/client_setup_model.dart';
import 'package:hearooz/models/device%20registration/current_user_model.dart';

class ApiRegisteration {
  late ClientSetupModel clientSetup;
  late CurrentUser currentUser;
  late String sessionId;

  ApiRegisteration(this.clientSetup, this.currentUser, this.sessionId);

  ApiRegisteration.fromMap(Map<String, dynamic> map) {
    clientSetup = ClientSetupModel.fromMap(map["client_setup"]);
    currentUser = CurrentUser.fromMap(map["current_user"]);
    sessionId = map["session_id"];
  }
}
