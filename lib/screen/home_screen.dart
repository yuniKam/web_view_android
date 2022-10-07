import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  // controller를 저정한 후 사용하기 위해
  WebViewController? controller;
  final homeUrl = 'https://blog.codefactory.ai';

  //const HomeScreen({Key? key}) : super(key: key);
  // const 삭제 - controller 변수를 final로 선언하지 않았기 때문이다.
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('yunik'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                // http://
                // Https://
                if (controller == null) {
                  return;
                }
                controller!.loadUrl(homeUrl);
              },
              icon: Icon(Icons.home))
        ],
      ),
      body: WebView(
        onWebViewCreated: (WebViewController controller) {
          this.controller = controller;
        },
        initialUrl: homeUrl,
        //initialUrl: 'https://yuni-k.tistory.com',
        javascriptMode: JavascriptMode.unrestricted,
        // webview 사용시 항상 JavascriptMode를 unrestricted하여 사용할수 있도록 한다.
      ),
    );
  }
}
