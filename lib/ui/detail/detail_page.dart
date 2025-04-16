import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_local_search_app/data/model/local.dart';

class DetailPage extends StatelessWidget {
  DetailPage(this.local);
  Local local;

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(title: Text(local.title)),
      body: InAppWebView(
        initialSettings: InAppWebViewSettings(
          mediaPlaybackRequiresUserGesture: true,
          javaScriptEnabled: true,
          userAgent:
              'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1',
        ),
        initialUrlRequest: URLRequest(url: WebUri(local.link)),
      ),
    );
  }
}
