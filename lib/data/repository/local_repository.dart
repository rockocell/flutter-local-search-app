import 'dart:convert';

import 'package:flutter_local_search_app/data/model/local.dart';
import 'package:http/http.dart';

class LocalRepository {
  Future<List<Local>?> search(String query) async {
    try {
      Client client = Client();
      Response result = await client.get(
        Uri.parse(
          'https://openapi.naver.com/v1/search/local.json?query=$query&display=5',
        ),
        headers: {
          'X-Naver-Client-Id': 'iu2OsbtANrPdWlxKwFzI',
          'X-Naver-Client-Secret': 'zdPq0tUzMR',
        },
      );
      final json = jsonDecode(result.body);

      if (result.statusCode == 200) {
        return List.from(json['items']).map((e) => Local.fromJson(e)).toList();
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
