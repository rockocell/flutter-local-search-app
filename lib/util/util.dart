String removeHtmlTags(String htmlText) {
  final regex = RegExp(r'<[^>]*>', multiLine: true);
  return htmlText.replaceAll(regex, '');
}

String simplifyAddress(String rawAddress) {
  final parts = rawAddress.split(' ');
  if (parts.length >= 3) {
    return '${parts[2]}';
  } else {
    return rawAddress;
  }
}
