// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class Googlehome extends StatefulWidget {
//   const Googlehome({super.key});
//
//   @override
//   State<Googlehome> createState() => _GooglehomeState();
// }
//
// class _GooglehomeState extends State<Googlehome> {
//   Completer<GoogleMapController> _completer = Completer();
//   static final CameraPosition _keyposition = CameraPosition(
//       target: LatLng(23.79089809200417, 90.40954134637299), zoom: 14.4746);
//
//   final List<Marker> _list = <Marker>[
//     // Marker(
//     //     markerId: MarkerId('1'),
//     //     position: LatLng(23.79089809200417, 90.40954134637299),
//     //     infoWindow: InfoWindow(title: "My location"))
//   ];
//   Set<Polyline> _polyline = {};
//
//   loadData() {
//     geolocator().then((value) async {
//       print('my current location');
//       print(value.latitude.toString() + " " + value.longitude.toString());
//
//       _list.add(
//           Marker(
//           markerId: MarkerId('2'),
//           position: LatLng(value.latitude, value.longitude),
//           infoWindow: InfoWindow(title: 'My current location')));
//
//       CameraPosition cameraPosition = CameraPosition(
//         target: LatLng(value.latitude, value.longitude),
//       );
//       final GoogleMapController controller = await _completer.future;
//       controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//       setState(() {});
//     });
//   }
//
//   Future<Position> geolocator() async {
//     await Geolocator.requestPermission()
//         .then((value) {})
//         .onError((error, stackTrace) {
//       print("errors" + error.toString());
//     });
//
//     return await Geolocator.getCurrentPosition();
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loadData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Map'),
//       ),
//       body: GoogleMap(
//         initialCameraPosition: _keyposition,
//         markers: Set<Marker>.of(_list),
//         onMapCreated: (GoogleMapController controller) {
//           _completer.complete(controller);
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           loadData();
//         },
//         child: Icon(Icons.location_disabled),
//       ),
//     );
//   }
// }
//


//
// class _GooglehomeState extends State<Googlehome> {
//   Completer<GoogleMapController> _completer = Completer();
//   static final CameraPosition _keyposition = CameraPosition(
//     target: LatLng(23.79089809200417, 90.40954134637299),
//     zoom: 14.4746,
//   );
//
//   final List<Marker> _list = <Marker>[];
//
//   Set<Polyline> _polyline = {};
//
//   loadData() {
//     geolocator().then((value) async {
//       print('my current location');
//       print(value.latitude.toString() + " " + value.longitude.toString());
//
//       _list.add(
//         Marker(
//           markerId: MarkerId('2'),
//           position: LatLng(value.latitude, value.longitude),
//           infoWindow: InfoWindow(
//             title: 'My current location ${LatLng(value.latitude, value.longitude)}',
//           ),
//         ),
//       );
//
//       if (_list.length > 1) {
//         _polyline.add(
//           Polyline(
//             polylineId: PolylineId('polyLine'),
//             points: [
//               _list[_list.length - 2].position,
//               _list[_list.length - 1].position,
//             ],
//             color: Colors.blue,
//             width: 5,
//           ),
//         );
//       }
//
//       CameraPosition cameraPosition = CameraPosition(
//         target: LatLng(value.latitude, value.longitude),
//       );
//       final GoogleMapController controller = await _completer.future;
//       controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//
//       setState(() {});
//     });
//   }
//
//   Future<Position> geolocator() async {
//     await Geolocator.requestPermission()
//         .then((value) {})
//         .onError((error, stackTrace) {
//       print("errors" + error.toString());
//     });
//
//     return await Geolocator.getCurrentPosition();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Map'),
//       ),
//       body: GoogleMap(
//         initialCameraPosition: _keyposition,
//         markers: Set<Marker>.of(_list),
//         polylines: _polyline,
//         onMapCreated: (GoogleMapController controller) {
//           _completer.complete(controller);
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           loadData();
//         },
//         child: Icon(Icons.location_disabled),
//       ),
//     );
//   }
// }
