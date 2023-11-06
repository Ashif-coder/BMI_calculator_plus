import 'dart:convert';

import 'package:bmi/constants/color_manger.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';






class ConditionWebViewScreen extends StatefulWidget {
  const ConditionWebViewScreen({Key? key,required this.url,required this.title, this.isHTML = false}) : super(key: key);
  final String? url;
  final String? title;
  final bool? isHTML;
  @override
  State<ConditionWebViewScreen> createState() => _ConditionWebViewScreenState();
}

class _ConditionWebViewScreenState extends State<ConditionWebViewScreen> {
  // final Completer<WebViewController> _controller = Completer<WebViewController>();
  late WebViewController _controller;
  int loadingPercentage = 0;


  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000)) // Only if you need a specific background color.
      ..setNavigationDelegate(NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              loadingPercentage = progress;
            });
            // Logic for handling progress can be placed here.
          },
          onPageStarted: (String url) {
            setState(() {
              loadingPercentage = 0;
            });
            // Logic when page starts loading can be placed here.
          },
          onPageFinished: (String url) {
            setState(() {
              loadingPercentage = 100;
            });
          },

        // Other navigation decisions can be placed here as well.
      ),)
      ..loadRequest((widget.isHTML ?? false )? Uri.dataFromString(widget.url ?? "",mimeType: 'text/html',encoding: Encoding.getByName("utf-8")):Uri.parse(widget.url ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon:const Icon(Icons.clear),
            onPressed: ()=>Navigator.pop(context),),
          title:  Text(widget.title ?? ""),
        ),
        body: Stack(
          children: [
            WebViewWidget(
              controller: _controller,
            ),
            if (loadingPercentage < 100)
              LinearProgressIndicator(
                value: loadingPercentage / 100.0,
                color: ColorManager.kBottomCardColor,
                backgroundColor:  ColorManager.kInActiveCardColor,
              ),
          ],
        )
    );
  }

}