import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_local_search_app/data/model/location.dart';

class DetailPage extends StatelessWidget {
  DetailPage(this.location);
  Location location;

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(title: Text(location.title)),
      body:
          location.link.isNotEmpty
              ? InAppWebView(
                initialSettings: InAppWebViewSettings(
                  mediaPlaybackRequiresUserGesture: true,
                  javaScriptEnabled: true,
                  userAgent:
                      'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1', // ios 사파리 모바일
                ),
                initialUrlRequest: URLRequest(url: WebUri(location.link)),
              )
              : InAppWebView(
                initialSettings: InAppWebViewSettings(
                  mediaPlaybackRequiresUserGesture: true,
                  javaScriptEnabled: true,
                  userAgent:
                      'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1', // ios 사파리 모바일
                ),
                initialUrlRequest: URLRequest(
                  url: WebUri(
                    'https://m.map.naver.com/search2/search.naver?query=${Uri.encodeComponent(location.title)}',
                  ),
                ),
              ),
    );
  }
}
