class Local {
  String title;
  String link;
  List<String> category;
  List<String> roadAddress;

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
        category: ['category'],
        roadAddress: ['roadAddress'],
      );

  Map<String, dynamic> toJson() => {
    'title': title,
    'link': link,
    'category': category,
    'roadAddress': roadAddress,
  };
}
