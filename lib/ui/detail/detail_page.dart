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
          (location.link.isNotEmpty && location.link.startsWith('https://'))
              ? InAppWebView(
                // location.link 있는 경우 해당 링크 연결
                initialSettings: InAppWebViewSettings(
                  mediaPlaybackRequiresUserGesture: true,
                  javaScriptEnabled: true,
                  userAgent:
                      'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1', // ios 사파리 모바일
                ),
                initialUrlRequest: URLRequest(url: WebUri(location.link)),
              )
              : InAppWebView(
                // location.link 없는 경우 location.title 네이버맵에서 검색한 url 연결
                initialSettings: InAppWebViewSettings(
                  mediaPlaybackRequiresUserGesture: true,
                  javaScriptEnabled: true,
                  userAgent:
                      'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1', // ios 사파리 모바일
                ),
                initialUrlRequest: URLRequest(
                  url: WebUri(
                    'https://m.map.naver.com/search2/search.naver?query=${location.title}',
                  ),
                ),
              ),
    );
  }
}
