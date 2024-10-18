import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/provider/provider_page.dart';
import 'package:provider/provider.dart';

String? selectedItem;
// InAppWebViewController? webViewController;
late InAppWebViewController? _webViewController;

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
        title: const Text('My Browser'),
        actions: [
          PopupMenuButton(
            initialValue: selectedItem,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text('All BookMarks'),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text('Search Engine'),
              ),
            ],
            onSelected: (value) {
              if (value == 2) {
                showDialog(
                  context: context,
                  builder: (context) {
                    String search = homeProviderTrue.txtSearch.text;
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
                            },
                          ),
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
                    return Text('--');
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
                controller: homeProviderFalse.txtSearch,
                onSubmitted: (value) {
                  _webViewController?.loadUrl(
                        urlRequest: URLRequest(
                          url: WebUri(
                              "https://www.google.com/search?q=$value"),
                        ),
                      );
                  // homeProviderFalse.searchCategory(value);
                  print('--------------------------------------');
                },
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black))),
              ),
            ),
          ),
        ),
      ),
      body: StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            return InAppWebView(
              initialUrlRequest:
                  URLRequest(url: WebUri("https://www.google.com")),
              onWebViewCreated: (InAppWebViewController controller) {
                _webViewController = controller;
              },
            );
          }),
      bottomNavigationBar: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(color: Colors.grey.shade200),
        child:  Row(
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
            GestureDetector(
              onTap: (){
                _webViewController?.goBack();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
            ),
        GestureDetector(
          onTap: (){
            _webViewController?.reload();
          },child: Icon(
              Icons.refresh,
              color: Colors.grey,
            ),),

        GestureDetector(
          onTap: (){
            _webViewController?.goForward();
          },child:
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),),
          ],
        ),
      ),
    );
  }
}
