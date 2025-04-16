String removeHtmlTags(String htmlText) {
  final regex = RegExp(r'<[^>]*>', multiLine: true);
  return htmlText.replaceAll(regex, '');
}

String simplifyAddress(String raw) {
  final parts = raw.split(' ');
  for (var part in parts) {
    if (part.contains('동')) {
      return part;
    } // (ㅇㅇ도) ㅇㅇ시 ㅇㅇ구 ㅇㅇ동 ... 에서 'ㅇㅇ동' 사용
  }
  return raw;
}
