import 'package:geolocator/geolocator.dart';

Future<Position> getCurrentLocation() async {
  LocationPermission permission = await Geolocator.checkPermission();

  // 위치 권한 거부된 경우
  // 위치 권한 요청
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('위치 권한 접근 불가');
    }
  }

  bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
  // 위치 권한 사용 불가능한경우
  // 위치 권한 요청
  if (!isLocationServiceEnabled) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('위치 권한 접근 불가');
    }
  }

  // 현재 위치 리턴
  final position = await Geolocator.getCurrentPosition(
    locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
  );

  return position;
}
