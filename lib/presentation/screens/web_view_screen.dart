import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebView extends StatefulWidget {
  final String urlWeb;
  const WebView({super.key, required this.urlWeb});

  @override
  State<WebView> createState() => _InAppBrowserScreenState();
}

class _InAppBrowserScreenState extends State<WebView> {
  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
                      value: _progress,
                      backgroundColor: Colors.blue.withOpacity(0.2),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
