import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailNews extends StatefulWidget {
  final String url;
  final String title;
  final String name;

  DetailNews({Key? key, required this.url,required this.title, required this.name}) : super(key: key);

  @override
  State<DetailNews> createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Color(0xffef5252),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          widget.name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18),
        ),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageFinished: (String url) {
              setState(() {
                _isLoading = false;
              });
            },
            onWebResourceError: (WebResourceError error) {
              // Handle web resource errors here
              print("WebResourceError: $error");
            },
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(color: Color(0xffef5252),),
            ),
        ],
      ),
    );
  }
}
