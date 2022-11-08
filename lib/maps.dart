import 'package:flutter/material.dart';
import 'package:provisions/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => MapsPageState();
} //MyHomePage

class MapsPageState extends State<MapsPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(46.8188, -92.0843);

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    Marker marker = const Marker(
      markerId: MarkerId('Tavern'),
      position: LatLng(46.81814567357251, -92.07721304313327),
      infoWindow: InfoWindow(title: 'Tavern', snippet: 'Expensive burgers'),
    );

    Marker marker2 = const Marker(
      markerId: MarkerId('PhoHolic'),
      position: LatLng(46.80075523103305, -92.12578304633212),
      infoWindow: InfoWindow(title: 'PhoHolic', snippet: 'Great asian food'),
    );

    Marker marker3 = const Marker(
      markerId: MarkerId('Buffalo Wild Wings'),
      position: LatLng(46.80622977107151, -92.15531751565206),
      infoWindow: InfoWindow(title: 'Buffalo Wild Wings', snippet: 'I like the tap water'),
    );

    setState(() {
      // adding a new marker to map
      markers[MarkerId('Tavern')] = marker;
      markers[MarkerId('PhoHolic')] = marker2;
      markers[MarkerId('Buffalo Wild Wings')] = marker3;
    }); //setState

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps'),
          backgroundColor: MyColors.provisionGreen,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: markers.values.toSet(),
        ),
      ),
    );
  }
}
