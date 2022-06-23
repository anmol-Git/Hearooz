import 'package:flutter/cupertino.dart';

class ProfileScreenProvider with ChangeNotifier {
  bool? isVerfied = false;

  void verfied() {
    isVerfied = true;
    notifyListeners();
  }
}
