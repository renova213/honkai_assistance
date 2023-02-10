import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebViewScreen extends StatefulWidget {
  final String urlWeb;
  const WebViewScreen({super.key, required this.urlWeb});

  @override
  State<WebViewScreen> createState() => _InAppBrowserScreenState();
}

class _InAppBrowserScreenState extends State<WebViewScreen> {
  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse(widget.urlWeb),
              ),
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                setState(
                  () {
                    _progress = progress / 100;
                  },
                );
              },
            ),
            _progress < 1
                ? SizedBox(
                    height: 3.h,
                    child: LinearProgressIndicator(
                        value: _progress, backgroundColor: Colors.blue),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
