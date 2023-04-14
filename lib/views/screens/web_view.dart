// ignore_for_file: must_be_immutable

import 'package:assign_project/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatelessWidget {
  WebViewController cont;
  WebView({required this.cont, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: WebViewWidget(controller: cont),
    );
  }
}