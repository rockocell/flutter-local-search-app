import 'package:flutter_local_search_app/util/util.dart';

class Location {
  String title;
  String link;
  String category;
  String roadAddress;

  Location({
    required this.title,
    required this.link,
    required this.category,
    required this.roadAddress,
  });

  Location.fromJson(Map<String, dynamic> json)
    : this(
        title: removeHtmlTags(json['title']),
        link: removeHtmlTags(json['link']),
        category: removeHtmlTags(json['category']),
        roadAddress: removeHtmlTags(json['roadAddress']),
      );

  Map<String, dynamic> toJson() => {
    'title': title,
    'link': link,
    'category': category,
    'roadAddress': roadAddress,
  };
}
