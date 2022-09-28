import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteItemProvider extends ChangeNotifier {
  final String _baseurl = "https://api.hearooz.de/api/v1/user/profile";
  bool isHeartButtonTapped = false;
  List<dynamic> list = [];

  void heartButtonUpdate() {
    isHeartButtonTapped = !isHeartButtonTapped;
    notifyListeners();
  }

  Future<void> addToFavorite(String auth, dynamic item, dynamic trackId) async {
    var response = await http.patch(Uri.parse(_baseurl), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $auth'
    }, body: {
      "action": "add",
      "key": "favorites",
      "value": item['id']
    });

    if (response.statusCode == 200) {
      saveData(item);
      notifyListeners();
      //   writeCounter();
    } else {
      Future.error('item not added to the favorite');
    }
  }

  Future<void> removeFromFavorite(String auth, dynamic item, int index) async {
    var response = await http.patch(Uri.parse(_baseurl), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $auth'
    }, body: {
      "action": "remove",
      "key": "favorites",
      "value": item['id']
    });

    if (response.statusCode == 200) {
      list.removeAt(index);
      updateSaveData();
      notifyListeners();
      //  writeCounter();
    } else {
      Future.error('item not removed from the favorite');
    }
  }

  // Future<void> favoriteItem(String refreshToken) async {
  //   try {
  //     var url = Uri.parse('https://api.hearooz.de/api/v1/user/profile');
  //     final response = await http.get(
  //       url,
  //       headers: {
  //         "Accept": "application/json",
  //         "Authorization": refreshToken,
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       final item = json.decode(response.body);

  //       List<dynamic> temp = item['profile']['favorites'];

  //       print('list size is ${list.length}');
  //       notifyListeners();
  //     } else {
  //       print('list size is ${list.length}');
  //       print('${response.statusCode} status is');
  //       return Future.error('Something went wrong');
  //     }
  //   } catch (e) {
  //     print('list size is ${list.length}');
  //     print(e.toString());
  //     return Future.error(e.toString());
  //   }
  // }

  Future get _localPath async {
    final Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future get _localFile async {
    final path = await _localPath;
    return File('$path/favorite_item.txt');
  }

  // Future writeCounter() async {
  //   final File file = await _localFile;
  //   if (await file.exists()) await file.delete();
  //   // Write the file
  //   var stringList = list.join('MMMM');
  //   notifyListeners();
  //   return file.writeAsString(stringList);
  // }

  // Future readCounter() async {
  //   final File file = await _localFile;

  //   // Read the file
  //   if (!await file.exists()) return;
  //   var temp = await file.readAsString();
  //   List<dynamic> templist = temp.split('MMMM');

  //   print('templist is $templist');
  //   //list.addAll(templist['data']);
  //   list.clear();
  //   for (dynamic ele in templist) {
  //     String curr = ele;
  //     ele = ele.replaceAll('{', '{"');
  //     ele = ele.replaceAll(': ', '": "');
  //     ele = ele.replaceAll(', ', '", "');
  //     ele = ele.replaceAll('}', '"}');

  //     list.add(json.decode(ele));
  //   }

  //   notifyListeners();
  //   print('the list item is $list');
  //   // If we encounter an error, return 0
  //   //print('error in read');
  //   // print
  //   return 0;
  // }

  saveData(dynamic data) async {
    final Map<String, String> item = <String, String>{};
    item['id'] = data['id'];
    item['title'] = data['data']['title'];
    item['cover_image'] = data['data']['cover_image'];

    for (var ele in list) {
      if (ele['id'] == item['id']) return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cart = prefs.getStringList("cartList");
    cart ??= [];
    var parsed = jsonEncode(item);
    cart.add(parsed);
    prefs.setStringList("cartList", cart);
    read();
  }

  updateSaveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> temp = [];
    for (var element in list) {
      temp.add(jsonEncode(element));
    }
    prefs.setStringList("cartList", temp);
  }

  read() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final cart = prefs.getStringList("cartList");
    list.clear();
    if (cart != null) {
      for (var item in cart) {
        print('priniting the item $item');
        list.add(jsonDecode(item));
      }
    } else {
      print('list is empty in read');
    }

    print('the new change list is $list');
    notifyListeners();
  }
}
