import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CatalogueRetrivalProvider with ChangeNotifier {
  final String _dataUrl = 'https://api.hearooz.de/api/v1/catalogue';

  CatalogueRetrivalProvider();

  var _jsonResonse = {};
  bool _isFetching = true;
  List<List<dynamic>> data = [];

  bool get isFetching => _isFetching;

  Future<void> fetchFirstCatalogue(String auth) async {
    _isFetching = true;
    notifyListeners();
    print('The auth coming to us $auth');

    var response = await http.get(Uri.parse(_dataUrl),
        headers: {'Accept': 'application/json', 'Authorization': auth});

    if (response.statusCode == 200) {
      _jsonResonse = json.decode(response.body);
      // data.addAll(_jsonResonse);

      //   var remaining = _jsonResonse['remaining_count'];

      //  var nextToken = _jsonResonse['next'].toString();

      List<dynamic> list = _jsonResonse["documents"];

      Set<String?> set = {};

      for (var id = 1; id < list.length; id++) {
        set.add(list[id]['data']['programme_id']);
      }

      print('the set length is ${set.length}');

      for (var s in set) {
        List<dynamic> tempList = list
            .where((element) => element['data']['programme_id'] == s)
            .toList();
        data.add(tempList);
      }
      //print('in here');
      //print(data);
      //print('out here');
      // await fetchNextCatalog(auth, nextToken);
      // //  data.addAll(_jsonResonse);
      // print('the next token is $nextToken');

      // remaining = _jsonResonse['remaining_count'];
      // nextToken = _jsonResonse['next'].toString();
      // print('the first remain $remaining');
      // if (remaining > 0) await fetchNextCatalog(auth, nextToken);
      // print('the next token is $nextToken');

      // remaining = _jsonResonse['remaining_count'];
      // nextToken = _jsonResonse['next'].toString();
      // print('the first remain $remaining');
      // if (remaining > 0) await fetchNextCatalog(auth, nextToken);
      // print('the next token is $nextToken');

      // remaining = _jsonResonse['remaining_count'];
      // nextToken = _jsonResonse['next'].toString();
      // print('the first remain $remaining');
      // if (remaining > 0) await fetchNextCatalog(auth, nextToken);
      // print('the next token is $nextToken the last ');
      // print(data);
      _isFetching = false;
      notifyListeners();
      return;
    }

    _isFetching = false;
    notifyListeners();
    return Future.error('Something went wrong!');
  }

  Future<void> fetchNextCatalog(String auth, String next) async {
    _isFetching = true;
    notifyListeners();

    var response = await http.get(Uri.parse('$_dataUrl?next=$next'),
        headers: {'Accept': 'application/json', 'Authorization': auth});

    if (response.statusCode == 200) {
      //  data.addAll(_jsonResonse);
      _jsonResonse = json.decode(response.body);
      return;
    }

    _isFetching = false;
    notifyListeners();
    return Future.error('Something went wrong!');
  }

  Future<List<dynamic>> searchCatalogue(String pattern) async {
    if (pattern == '' || pattern.length < 2) return [];
    List<dynamic> list = _jsonResonse["documents"];
    int count = 0;

    List<dynamic> tempList = [];

    for (int i = 1; i < list.length - 1; i++) {
      String? str = list[i]['data']['title'];
      if (str != null && str.indexOf(pattern) != -1) {
        tempList.add(list[i]);
      }
    }
    print('for $pattern called the list size is ${tempList.length}');
    return tempList;
  }
}
