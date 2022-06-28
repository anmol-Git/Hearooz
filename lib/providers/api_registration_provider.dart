import 'dart:convert';
import 'package:hearooz/models/device%20registration/api_registration.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApiRegistrationProvider with ChangeNotifier {
  String anonAuthToken = "";
  String userAuthToken = "";

  late ApiRegisteration result;

  Future<ApiRegisteration> anonomousUserRegistration() async {
    try {
      var url = Uri.parse('https://api.hearooz.de/api/v1/hello');
      final response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
        },
      );
      if (response.statusCode == 200) {
        anonAuthToken = response.headers["set-authorization"].toString();
        final item = json.decode(response.body);
        result = ApiRegisteration.fromMap(item);
        print(anonAuthToken);
        return result;
      } else {
        return Future.error('Something went wrong');
      }
    } catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }

  Future<ApiRegisteration> signedUpUserRegisteration(
      String refreshToken) async {
    try {
      var url = Uri.parse('https://api.hearooz.de/api/v1/hello');
      final response = await http.get(
        url,
        headers: {"Accept": "application/json", "Authorization": refreshToken},
      );
      if (response.statusCode == 200) {
        userAuthToken = response.headers["set-authorization"].toString();
        final item = json.decode(response.body);
        result = ApiRegisteration.fromMap(item);
        return result;
      } else {
        return Future.error('Something went wrong');
      }
    } catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }
}
