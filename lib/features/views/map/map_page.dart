import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:tracker/contants/palette.dart';
import 'package:tracker/features/views/map/map_helper.dart';
// import 'package:tracker/widgets/custom_app_bar.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapController mapController = MapController();
  MapHelper mapHelper = MapHelper();
  late LatLng initialPosition;
  late Position currentPosition;

  @override
  void initState() {
    _initPosition();
    _currentPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const PreferredSize(
      //   preferredSize: Size.fromHeight(56),
      //   child: CustomAppBar(),
      // ),
      body: Stack(
        children: [
          _map(),
        ],
      ),
    );
  }

  FlutterMap _map() {
    return FlutterMap(
      mapController: mapController,
      options: const MapOptions(
        initialCenter: LatLng(23.0422983, -82.3718383),
        initialZoom: 12,
        maxZoom: 19,
        interactionOptions: InteractionOptions(
            pinchZoomWinGestures:
                MultiFingerGesture.pinchZoom | MultiFingerGesture.pinchMove),
      ),
      children: [
        TileLayer(
          urlTemplate: mapHelper.mapHost,
          userAgentPackageName: mapHelper.packageName,
        ),
        CurrentLocationLayer(
          style: LocationMarkerStyle(
            marker: const DefaultLocationMarker(
                color: Palette.primaryColor,
                child: Icon(
                  LineAwesomeIcons.car,
                  color: Colors.white,
                )),
            markerSize: const Size.square(40),
            accuracyCircleColor: Palette.blueWithOpacity01,
            headingSectorColor: Palette.blueWithOpacity08,
            headingSectorRadius: 80,
          ),
          moveAnimationDuration: const Duration(milliseconds: 300),
          alignPositionOnUpdate: AlignOnUpdate.always,
        ),
      ],
    );
  }

  void _initPosition() async {
    initialPosition = await mapHelper.setInitialPosition();
  }

  void _currentPosition() async {
    await mapHelper.getLocationUpdates();
  }
}
