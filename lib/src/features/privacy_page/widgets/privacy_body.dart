import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyBody extends StatefulWidget {
  const PrivacyBody({super.key});

  @override
  State<PrivacyBody> createState() => _PrivacyBodyState();
}

class _PrivacyBodyState extends State<PrivacyBody> {
  late final WebViewController webViewController;

  @override
  void initState() {
    super.initState();

    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(
          'https://www.freeprivacypolicy.com/live/35539cd2-a27d-425d-814d-06279694f4ba',
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: webViewController);
  }
}
