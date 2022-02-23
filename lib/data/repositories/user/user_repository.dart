import 'package:geolocator/geolocator.dart';

const int _kLocationTimePeriodInMinutes = 5;

class UserRepository {
  final Position _defaultMoscowPosition = Position(
      longitude: 37.615401,
      latitude: 55.742793,
      timestamp: DateTime.now(),
      accuracy: .0,
      altitude: .0,
      heading: .0,
      speed: .0,
      speedAccuracy: .0);

  Position? _currentPosition;

  Future<Position> fetchUserPosition([bool force = false]) async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return _defaultMoscowPosition;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return _defaultMoscowPosition;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return _defaultMoscowPosition;
    }
    if (!force &&
        _currentPosition?.timestamp != null &&
        DateTime.now().difference(_currentPosition!.timestamp!).inMinutes <
            _kLocationTimePeriodInMinutes) {
      return _currentPosition!;
    }
    _currentPosition = await Geolocator.getCurrentPosition();
    return _currentPosition!;
  }
}
