import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Polygonmarker extends StatefulWidget {
  const Polygonmarker({super.key});

  @override
  State<Polygonmarker> createState() => _PolygonmarkerState();
}

class _PolygonmarkerState extends State<Polygonmarker> {

  Completer<GoogleMapController> _completer = Completer();
  CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(23.79089809200417, 90.40954134637299), zoom: 14.4746);
  final Set<Marker>_marker = {};
  Set<Polyline>_polyline = {};
  List<LatLng>point = [
    LatLng(23.79089809200417, 90.40954134637299),
    LatLng(23.783805036354952, 90.4044236958828),

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < point.length; i++) {
      _marker.add(

          Marker(markerId: MarkerId(i.toString()),
            position: point[i],
            infoWindow: InfoWindow(
                title: 'Really cool place',
                snippet: '5 star Rating'
            ),
            icon: BitmapDescriptor.defaultMarker,
          )
      );
      setState(() {

      });

      _polyline.add(
          Polyline(polylineId: PolylineId('1'),
            points: point,
          ));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Polygon"),),
      body: GoogleMap(
        markers: _marker,
        mapType: MapType.normal,
        initialCameraPosition: _cameraPosition,
        myLocationEnabled: false,
        myLocationButtonEnabled: true,
        polylines: _polyline,
        onMapCreated: (GoogleMapController controller) {
          _completer.complete(controller);
        },

      ),
    );
  }
}