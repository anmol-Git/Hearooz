import 'package:flutter/cupertino.dart';

class ProfileScreenProvider with ChangeNotifier {
  bool? isVerfied = false;
  bool? isTapped = false;
  void verfied() {
    isVerfied = true;
    notifyListeners();
  }

  void isCatalogueClicked(bool isTap) {
    isTapped = isTap;
    notifyListeners();
  }
}
