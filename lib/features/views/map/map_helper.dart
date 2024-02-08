import 'dart:async';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapHelper {
  String mapHost = 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';

  String packageName = 'com.example.tracker';

  late Position position;
  late StreamSubscription<Position> positionStream;
  static const locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 20,
  );

  Future<LatLng> setInitialPosition() async {
    // Load Initial Position
    position = await Geolocator.getCurrentPosition();
    LatLng initialPosition = const LatLng(0, 0);
    if (position.latitude.isFinite) {
      initialPosition = LatLng(position.latitude, position.longitude);
      return initialPosition;
    }
    return initialPosition;
  }

  Future<void> getLocationUpdates() async {
    bool initialized = false;
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings).listen(
      (Position currentPosition) async {
        if (!initialized) {
          position = currentPosition;
          initialized = true;
        }
      },
      onError: (e) {
        log('OnError: ${e.runtimeType}');
      },
    );
  }
}
