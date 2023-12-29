
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class Latlongtext extends StatefulWidget {
  const Latlongtext({super.key});

  @override
  State<Latlongtext> createState() => _LatlongtextState();
}

class _LatlongtextState extends State<Latlongtext> {
  String addres='';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("LatlongTest"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(addres),
          GestureDetector(
            onTap: ()async{
             // List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);
              List<Location> locations = await locationFromAddress("Gronausestraat 710, Enschede");

              setState(() {
  addres=locations.last.longitude.toString()+" "+locations.last.longitude.toString();
});
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green
              ),
              child: Center(child: Text("Convert")),
            ),
          )
        ],
      ),
    );
  }
}
