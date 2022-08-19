import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hearooz/providers/api_registration_provider.dart';
import 'package:hearooz/providers/profile_screen_provider.dart';
import 'package:provider/provider.dart';

class AudioManagerProvider with ChangeNotifier {
  String url = "";
  String title = "";
  String image = "";
  String audioFile = "";

  Future<void> setUpAudio(
      String url, String title, String image, BuildContext context) async {
    this.url = url;
    this.title = title;
    this.image = image;

    bool? verifyingProvider =
        Provider.of<ProfileScreenProvider>(context, listen: false).isVerfied;

    var authprovider =
        Provider.of<ApiRegistrationProvider>(context, listen: false);

    var auth = '';
    if (verifyingProvider == true) {
      auth = authprovider.userAuthToken;
    } else {
      auth = authprovider.anonAuthToken;
    }

    print(
        'url is ${this.url} \n\n title is ${this.title} \n\n image is ${this.image}');
    notifyListeners();
    await getTrack(context, url, auth);
  }

  Future<void> getTrack(
      BuildContext context, String trackid, String auth) async {
    //String _dataUrl = "https://api.hearooz.de/api/v1/tracks/$trackid/play";

    var url = Uri.https('api.hearooz.de', 'api/v1/tracks/$trackid/play');
    var response = await http.post(url, headers: {
      'Accept': 'application/json',
      'Authorization': auth,
      'Content-Type': 'application/json'
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

//print(await http.read(Uri.https('example.com', 'foobar.txt')));

    // var response = await http.post(Uri.parse(_dataUrl), headers: {
    //   'Accept': 'application/json',
    //   'Authorization': auth,
    // });

    print(
        'http request completed and the url used is $url and the auth used is $auth');
    if (response.statusCode == 200) {
      var _jsonResponse = json.decode(response.body);

      audioFile = _jsonResponse['location'];
      print('audio file is $audioFile');
    }
    print(
        "the status code is  ${response.statusCode} and the error ${response.body}");

    notifyListeners();
    return;
  }
}
