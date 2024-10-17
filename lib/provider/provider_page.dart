
import 'dart:io';

import 'package:flutter/cupertino.dart';
TextEditingController txtSearch = TextEditingController();

class HomeProvider extends ChangeNotifier
{

  String search = '';
  String webUrl = 'https://www.google.com/search?gs_ssp=google';

  void searchCategory(String search)
  {
    this.search = search;
    notifyListeners();
  }

}