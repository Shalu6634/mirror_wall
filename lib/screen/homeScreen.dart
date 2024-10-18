import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/provider/provider_page.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';

String? selectedItem;
InAppWebViewController? webViewController;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    HomeProvider homeProviderTrue =
        Provider.of<HomeProvider>(context, listen: true);
    HomeProvider homeProviderFalse =
        Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Browser'),
        actions: [
          PopupMenuButton(
            initialValue: selectedItem,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text('All BookMarks'),
              ),
              PopupMenuItem(
                value: 2,
                child: Text('Search Engine'),
              ),
            ],
            onSelected: (value) {
              if (value == 2) {
                showDialog(
                  context: context,
                  builder: (context) {
                    String search = txtSearch.text;
                    return AlertDialog(
                      title: const Text('Search Engine'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RadioListTile(
                              title: Text('Google'),
                              value: 'Google',
                              groupValue: homeProviderTrue.selectedEngine,
                              onChanged: (value) {
                                homeProviderFalse
                                    .changeSelectedSearchEngine(value!);
                                homeProviderFalse.searchCategory(search);
                                Navigator.pop(context);
                              }),
                          RadioListTile(
                              title: Text('Yahoo'),
                              value: 'Yahoo',
                              groupValue: homeProviderTrue.selectedEngine,
                              onChanged: (value) {
                                homeProviderFalse
                                    .changeSelectedSearchEngine(value!);
                                homeProviderFalse.searchCategory(search);
                                Navigator.pop(context);
                              }),
                          RadioListTile(
                              title: Text('Duck Duck Go'),
                              value: 'Duck Duck Go',
                              groupValue: homeProviderTrue.selectedEngine,
                              onChanged: (value) {
                                homeProviderFalse
                                    .changeSelectedSearchEngine(value!);
                                homeProviderFalse.searchCategory(search);
                                print(
                                    '=================================================================');
                                Navigator.pop(context);
                              }),
                          RadioListTile(
                              title: Text('bing'),
                              value: 'bing',
                              groupValue: homeProviderTrue.selectedEngine,
                              onChanged: (value) {
                                homeProviderFalse
                                    .changeSelectedSearchEngine(value!);
                                homeProviderFalse.searchCategory(search);
                                Navigator.pop(context);
                              }),
                        ],
                      ),
                    );
                  },
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    homeProviderFalse.search.toString();
                    return Text('data'); 
                  },
                );
              }
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: TextField(
                controller: txtSearch,
                onSubmitted: (value) {
                  homeProviderFalse.searchCategory(value);
                  print(value);
                },
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          (homeProviderTrue.isLoad)
              ? const LinearProgressIndicator(color: Colors.blue)
              : const SizedBox(
                  height: 1,
                ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InAppWebView(
                initialUrlRequest:
                    URLRequest(url: WebUri(homeProviderTrue.webUrl)),
                onWebViewCreated: (controller) {
                  webViewController = controller;
                },
                onLoadStart: (controller, url) {
                  homeProviderFalse.updateIsLoad(true);
                },
                onLoadStop: (controller, url) {
                  homeProviderFalse.updateIsLoad(false);
                  String search = txtSearch.text == ''
                      ? homeProviderTrue.selectedEngine
                      : txtSearch.text;
                },
              ),
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
