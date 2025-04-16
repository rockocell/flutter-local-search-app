import 'package:dio/dio.dart';
import 'package:flutter_local_search_app/data/get_current_location.dart';
import 'package:flutter_local_search_app/data/model/location.dart';
import 'package:flutter_local_search_app/data/repository/location_repository.dart';
import 'package:flutter_local_search_app/util/util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

class HomeState {
  HomeState({required this.locations});
  List<Location>? locations;
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState(locations: null);
  }

  Future<void> search(String query) async {
    LocationRepository locationRepository = LocationRepository();
    state = HomeState(locations: await locationRepository.search(query));
  }

  Future<void> searchByCurrentLocation() async {
    try {
      Position pos = await getCurrentLocation();
      print('${pos.latitude}, ${pos.longitude}'); // 기기 위도경도 확인
      final response = await Dio().get(
        'https://api.vworld.kr/req/address',
        queryParameters: {
          'service': 'address',
          'request': 'getAddress',
          'crs': 'EPSG:4326',
          'point': '${pos.longitude},${pos.latitude}',
          'format': 'json',
          'type': 'parcel',
          'key': 'A512983A-58CD-3367-B1B4-274DC84CB342',
        },
      );
      final result = response.data['response']['result'];
      if (result == null || result.isEmpty) {
        print('주소를 찾지 못했습니다. 좌표를 확인하세요.');
        return;
      }

      final raw = result[0]['text'];
      final simplifiedAdress = simplifyAddress(raw);
      await search(simplifiedAdress);
      print(raw);
      print(simplifiedAdress);
    } catch (e) {
      print(e);
    }
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
