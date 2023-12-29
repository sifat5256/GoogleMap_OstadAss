import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Polygonscreen extends StatefulWidget {
  const Polygonscreen({super.key});

  @override
  State<Polygonscreen> createState() => _PolygonscreenState();
}

class _PolygonscreenState extends State<Polygonscreen> {

  Completer<GoogleMapController> _completer = Completer();
  CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(23.79089809200417, 90.40954134637299), zoom: 14.4746);
 //final Set<Marker>_marker={};
 Set<Polygon>_polygon=HashSet<Polygon>();
  List<LatLng>point=[
    LatLng(23.79089809200417, 90.40954134637299),
    LatLng(23.783805036354952, 90.4044236958828),
    LatLng(23.786082717111267, 90.39554021997378),
    LatLng(23.7935438055923, 90.3971710029909),

    LatLng(23.79089809200417, 90.40954134637299),
  ];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _polygon.add(Polygon(polygonId: PolygonId("1"),points: point,
    fillColor: Colors.red,
      geodesic: true,
      strokeWidth: 4,
      strokeColor: Colors.deepOrange
    ));


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Polygon"),),
      body: GoogleMap(
       // markers: _marker,
        mapType: MapType.normal,
        initialCameraPosition: _cameraPosition,
        myLocationEnabled:false,
        myLocationButtonEnabled: true,
        polygons: _polygon,
        onMapCreated: (GoogleMapController controller){
          _completer.complete(controller);
        },

      ),
    );
  }
}
