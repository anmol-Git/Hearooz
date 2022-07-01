import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:hearooz/models/user%20profile/user_profile.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRegistrationProvider with ChangeNotifier {
  late Map<String, dynamic> responseBody;
  late UserProfile responseBodyVerified;
  late Map<String, dynamic> responseBodyReactivate;
  String refreshToken = '';
  Future<int> registerUser(String email, String authKey) async {
    final uri = Uri.parse('https://api.hearooz.de/api/v1/user');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': authKey
    };
    Map<String, dynamic> body = {
      "user": {"email": email, "accept_tos": true}
    };
    String jsonBody = json.encode(body);

    Response response = await post(
      uri,
      headers: headers,
      body: jsonBody,
    );
    int statusCode = response.statusCode;
    if (statusCode == 201) {
      responseBody = json.decode(response.body);
    } else {
      print(response);
    }

    return statusCode;
  }

  Future<int> verifyUser(String email, String pin, String authKey) async {
    final uri = Uri.parse('https://api.hearooz.de/api/v1/user/activate');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': authKey
    };
    Map<String, dynamic> body = {"email": email, "activation_tan": pin};
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    Response response = await post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    int statusCode = response.statusCode;
    if (statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      print(data.entries);
      responseBodyVerified = UserProfile.fromMap(data);
      print('This is the refresh token:- ' +
          responseBodyVerified.refreshToken.token);
      refreshToken = responseBodyVerified.refreshToken.token;
      storeData(responseBodyVerified
          .refreshToken.token); //storing to internal storage
    } else {
      print('the response is ' + response.body);
    }

    return statusCode;
  }

  Future<int> reactivateUser(String email, String authKey) async {
    final uri = Uri.parse('https://api.hearooz.de/api/v1/user/reactivate');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': authKey
    };
    Map<String, dynamic> body = {"email": email};
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    Response response = await post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    int statusCode = response.statusCode;
    if (statusCode == 200) {
      responseBodyReactivate = json.decode(response.body);
    }

    print('Reactivate status code is ' + statusCode.toString());
    return statusCode;
  }

  void storeData(String text) async {
    String finalText = "Bearer " + text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', finalText);
  }
}
