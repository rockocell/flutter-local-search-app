import 'package:flutter_local_search_app/data/model/location.dart';
import 'package:dio/dio.dart';

class LocationRepository {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://openapi.naver.com/v1/search/',
      headers: {
        'X-Naver-Client-Id': 'iu2OsbtANrPdWlxKwFzI',
        'X-Naver-Client-Secret': 'zdPq0tUzMR',
      },
    ),
  );

  Future<List<Location>> search(String query) async {
    try {
      final response = await dio.get(
        'local.json',
        queryParameters: {'query': query, 'display': 5},
      );

      final items = response.data['items'] as List;
      return items.map((item) => Location.fromJson(item)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
