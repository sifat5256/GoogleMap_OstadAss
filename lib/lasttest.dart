import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Googlehome extends StatefulWidget {
  const Googlehome({Key? key}) : super(key: key);

  @override
  State<Googlehome> createState() => _GooglehomeState();
}

class _GooglehomeState extends State<Googlehome> {
  Completer<GoogleMapController> _completer = Completer();
  static final CameraPosition _keyposition =
  CameraPosition(target: LatLng(23.79089809200417, 90.40954134637299), zoom: 14.4746);

  final List<Marker> _markers = <Marker>[];
  Set<Polyline> _polylines = {};

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    loadData();
    startLocationUpdates();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  loadData() {
    geolocator().then((value) async {
      print('my current location');
      print(value.latitude.toString() + " " + value.longitude.toString());

      _markers.add(
        Marker(
          markerId: MarkerId('2'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: InfoWindow(title: 'My current location', snippet: 'Lat: ${value.latitude}, Lng: ${value.longitude}'),
        ),
      );

      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
      );
      final GoogleMapController controller = await _completer.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

      if (_markers.length > 1) {
        _polylines.add(
          Polyline(
            polylineId: PolylineId('polyline'),
            points: _markers.map((marker) => marker.position).toList(),
            color: Colors.blue,
            width: 5,
          ),
        );
      }

      setState(() {});
    });
  }

  Future<Position> geolocator() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("errors" + error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  startLocationUpdates() {
    const duration = Duration(seconds: 10);
    _timer = Timer.periodic(duration, (Timer t) {
      loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: _keyposition,
        markers: Set<Marker>.of(_markers),
        polylines: _polylines,
        onMapCreated: (GoogleMapController controller) {
          _completer.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          loadData();
        },
        child: Icon(Icons.location_disabled),
      ),
    );
  }
}

