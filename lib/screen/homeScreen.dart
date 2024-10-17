import 'package:flutter/material.dart';
import 'package:mirror_wall/provider/provider_page.dart';
import 'package:provider/provider.dart';

String? selectedItem;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    HomeProvider homeProviderTrue = Provider.of<HomeProvider>(context,listen: true);
    HomeProvider homeProviderFalse = Provider.of<HomeProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Browser'),
        actions: [
         PopupMenuButton( initialValue: selectedItem,
          onSelected: (value) {

          },itemBuilder: (context) => [

           const PopupMenuItem(
             value: 1,
             child: Text('All BookMarks'),
           ),
           const PopupMenuItem(
             value:2,
             child: Text('Search Engine'),
           ),

         ],),
        ],
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller:txtSearch,
              decoration:  InputDecoration(
                  suffixIcon: GestureDetector(onTap: (){
                    String search = txtSearch.text;
                    homeProviderFalse.searchCategory(search);
                  },child: const Icon(Icons.search)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),

        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(color: Colors.grey.shade200),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.home,
              color: Colors.grey,
              size: 29,
            ),
            Icon(
              Icons.bookmark_add_outlined,
              color: Colors.grey,
              size: 29,
            ),
            Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
            Icon(
              Icons.refresh,
              color: Colors.grey,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
