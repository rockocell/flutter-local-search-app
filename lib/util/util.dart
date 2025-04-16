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
    else if (part.contains('읍')) {
      return part;
    } else if (part.contains('면')) {
      return part;
    }
  }
  return raw;
}
