import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  // ignore: prefer_const_constructors
  static final CameraPosition _kGooglePlex = CameraPosition(
    // ignore: prefer_const_constructors
    target: LatLng(39.92505374116969, 32.836953486044024),
    zoom: 18,
  );

  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  late LatLng selectedLocation;
  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
  }

  List<Marker> myMarker = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: Map._kGooglePlex,
        mapType: MapType.normal,
        onTap: _handleTap,
        markers: Set.from(myMarker),
        compassEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),

      // on pressing floating action button the camera will take to user current location
    );
  }

  void _handleTap(LatLng tappedPoint) {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    locationProvider.updateLocation(tappedPoint);

    setState(() {
      myMarker = [];
      myMarker.add(
        Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
          draggable: true,
          onDragEnd: (dragEndPosition) {
            print(dragEndPosition);
          },
        ),
      );
      selectedLocation = tappedPoint;
    });
  }
}
