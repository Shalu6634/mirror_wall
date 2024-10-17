import 'package:flutter/material.dart';

final List<DropdownMenuItem<dynamic>>? items = [
  const DropdownMenuItem(
    child: Text('All Bookmarks'),
    value: 1,
  ),
  const DropdownMenuItem(
    child: Text('Search Engine'),
    value: 2,
  ),
];
String? selectedItem;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Browser'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: DropdownButton(items: items, onChanged: (value) {

            }),
          ),
        ],
      ),
      body: Column(
        children: [

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
