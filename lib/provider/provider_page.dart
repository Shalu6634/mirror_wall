import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController txtSearch = TextEditingController();

class HomeProvider extends ChangeNotifier {
  String search = '';
  String webUrl = 'https://www.google.com/search?gs_ssp=google';
  String selectedEngine = 'Google';
  bool isLoad = true;
  List<String> historyList = [];
  // void searchChange(String search)
  // {
  //   this.search = search;
  //   notifyListeners();
  // }
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
  Future<void> addHistory(String url, String query) async {
    try{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      bool check = false;
      for(int i=0; i<historyList.length; i++){
        if(url == historyList[i].split('---').sublist(0, 1).join(" ")){
          check = true;
          break;
        }
      }
      if(!check){
        historyList.add("$url---$query");
        notifyListeners();
        sharedPreferences.setStringList("history", historyList);
      }
    }catch(e){
      print("Error into store history -> $e");
    }
  }
}
