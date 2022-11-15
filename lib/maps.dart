import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provisions/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

// --no-sound-null-safety  <-- arg for .dart file launch configurations

const kGoogleApiKey = "AIzaSyB60rEfnkN6QZNkD5GOUuTcLV4w-Qa5ZPM";




class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => MapsPageState();

} //MyHomePage

class MapsPageState extends State<MapsPage> {


  void locatePosition() async {

    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
  }


  final LatLng _center = const LatLng(46.8188, -92.0843);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120.0),
            child: AppBar(
              centerTitle: true,
              title: const Text('Provisions'),
              automaticallyImplyLeading: false,
              backgroundColor: MyColors.provisionGreen,
              flexibleSpace: Stack(
                children: <Widget>[
                  Positioned(
                    top: 80.0,
                    right: 15.0,
                    left: 15.0,
                    child: Container(
                      height: 50.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Enter Address',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15.0, top: 15.0),
                            suffixIcon: IconButton(
                                onPressed: null,
                                icon: Icon(Icons.search),
                                iconSize: 30.0)),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          body: Stack(
            children: <Widget>[
              GoogleMap(
                padding: EdgeInsets.only(top: 400.0),
                mapType: MapType.normal,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 5.0,
                ),
                onMapCreated: (GoogleMapController controller) {
                  locatePosition();
                  },
              ),
            ],
          ),
      ),
    );
  } //build

}// Widget


