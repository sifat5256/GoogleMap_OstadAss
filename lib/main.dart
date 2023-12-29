import 'package:asriftaj/google_map.dart';
import 'package:asriftaj/latlong_test.dart';
import 'package:asriftaj/polygon_drow.dart';
import 'package:asriftaj/polygon_mark/polygon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'lasttest.dart';
void main(){
  runApp(Myapps());
}
class Myapps extends StatelessWidget {
  const Myapps({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Googlehome(),
    );
  }
}
