//search browser
//website history save
//back and forward
//loader
//refresh
//user selective search engine
//onclick page of history 
//home button

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirror_wall/provider/provider_page.dart';
import 'package:mirror_wall/screen/homeScreen.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=>HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

      ),
    );
  }
}

