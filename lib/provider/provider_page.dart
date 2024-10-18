import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeProvider extends ChangeNotifier {
  TextEditingController txtSearch = TextEditingController();

  String search = '';
  String webUrl = 'https://www.google.com/search?gs_ssp=google';
  String selectedEngine = 'Google';
  bool isLoad = true;
  List<String> historyList = [];
  void searchChange(String search)
  {
    this.search = search;
    notifyListeners();
  }
  void updateIsLoad(bool status) {
    isLoad = status;
    notifyListeners();
  }
  void changeSelectedSearchEngine(String selectedEngine){
    this.selectedEngine = selectedEngine;
    notifyListeners();
  }
  void searchCategory(String search) {
    if (selectedEngine == "Yahoo") {
      selectedEngine = "https://search.yahoo.com/search?p=$search";
    } else if (selectedEngine == "Duck Duck Go") {
      selectedEngine = "https://www.google.com/search?gs_ssp=$search";
    } else if (selectedEngine == "bing") {
      selectedEngine = "https://www.bing.com/search?q=$search";
    } else {
      selectedEngine = "https://www.google.com/search?q=$search";
    }
    notifyListeners();
  }

}
