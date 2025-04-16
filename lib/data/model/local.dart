class Local {
  String title;
  String link;
  String category;
  String roadAddress;

  Local({
    required this.title,
    required this.link,
    required this.category,
    required this.roadAddress,
  });

  Local.fromJson(Map<String, dynamic> json)
    : this(
        title: json['title'],
        link: json['link'],
        category: json['category'],
        roadAddress: json['roadAddress'],
      );

  Map<String, dynamic> toJson() => {
    'title': title,
    'link': link,
    'category': category,
    'roadAddress': roadAddress,
  };
  // TODO: title에 줄바꿈 코드 있는 경우 대처
  // TODO: List<String> 형태 변수 컨버트 fix
}
