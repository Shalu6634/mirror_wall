import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeProvider extends ChangeNotifier {
  TextEditingController txtSearch = TextEditingController();

  String search = 'google';
  String webUrl = 'https://www.google.com/search?gs_ssp=google';
  String selectedEngine = ' ';
  bool isLoad = true;
  List<String> historyList = [];

  List<String> urlData = [];
  List<String> searchData = [];
  List<String> searchUrlData = [];
  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    getListOfData();
  }

  HomeProvider() {
    getData();
    getListOfData();
  }
  void searchChange(String search)
  {
    this.search = search;
    notifyListeners();
  }
  void updateIsLoad(bool status) {
    isLoad = status;
    notifyListeners();
  }
  void changeSelectedSearchEngine(String value, String data){
    this.selectedEngine = value;
    print(selectedEngine);
    print('--------------------------------------------------------');
    notifyListeners();
  }


  Future<void> setData(String name, String url) async {
    historyList.add(name);
    urlData.add(url);
    print(historyList);
    print(urlData);
    final SharedPreferences ref = await SharedPreferences.getInstance();
    ref.setStringList('search', historyList);
    ref.setStringList('url', urlData);
    notifyListeners();
  }

  Future<void> searchHistory(String name, String url) async {
    searchData.add(name);
    searchUrlData.add(url);
    final SharedPreferences ref = await SharedPreferences.getInstance();
    ref.setStringList('search1', searchData);
    ref.setStringList('url1', searchUrlData);
    notifyListeners();
  }

  Future<void> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    historyList = sharedPreferences.getStringList('search') ?? [];
    urlData = sharedPreferences.getStringList('url') ?? [];
    notifyListeners();
  }

  Future<void> getListOfData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    searchData = sharedPreferences.getStringList('search1') ?? [];
    searchUrlData = sharedPreferences.getStringList('url1') ?? [];
    notifyListeners();
  }
}
