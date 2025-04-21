import 'package:dio/dio.dart';
import 'package:flutter_local_search_app/data/model/location.dart';
import 'package:flutter_local_search_app/data/repository/location_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  HomeState({required this.locations});
  List<Location>? locations;
}

class HomeViewModel extends Notifier<HomeState> {
  final Dio _client = Dio(BaseOptions(validateStatus: (status) => true));

  @override
  HomeState build() {
    return HomeState(locations: null);
  }

  Future<void> search(String query) async {
    LocationRepository locationRepository = LocationRepository();
    state = HomeState(locations: await locationRepository.search(query));
  }

  Future<void> searchByCurrentLocation(double lat, double lng) async {
    try {
      final response = await _client.get(
        'https://api.vworld.kr/req/data',
        queryParameters: {
          'request': 'GetFeature',
          'key': 'A512983A-58CD-3367-B1B4-274DC84CB342',
          'data': 'LT_C_ADEMD_INFO',
          'geomFilter': 'POINT($lng $lat)',
          'geometry': false,
          'size': 5,
        },
      );
      if (response.statusCode == 200 &&
          response.data['response']['status'] == 'OK') {
        final features =
            response
                .data['response']['result']['featureCollection']['features'];
        final featureList = List.from(features);
        final iterable = featureList.map((feature) {
          return '${feature['properties']['full_nm']}';
        });
        final String query = iterable.first;
        search(query);
      }
    } catch (e) {
      print(e);
    }
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
