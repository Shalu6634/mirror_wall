
import 'dart:io';

import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier
{
  var txtSearch = TextEditingController();
  String search = '';

  void searchCategory(String search)
  {
    this.search = search;
    notifyListeners();
  }

}