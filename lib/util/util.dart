String removeHtmlTags(String htmlText) {
  final regex = RegExp(r'<[^>]*>', multiLine: true);
  return htmlText.replaceAll(regex, '');
}
