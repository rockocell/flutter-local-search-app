import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

  Future<void> searchByCurrentLocation(BuildContext context) async {
    try {
      Position pos = await getCurrentLocation();
      // dio로 vworld api에 위도경도 보내서 해당 위도경도의 주소 정보(parcel 타입) 받기
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '주소를 찾지 못했습니다. 기기 좌표를 확인해 주세요.',
              textAlign: TextAlign.center,
            ),
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 80),
          ),
        );
        return;
      }

      final raw = result[0]['text'];
      final addressQuery = simplifyAddress(raw);
      print(addressQuery);
      await search(addressQuery);
    } catch (e) {
      print(e);
    }
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
