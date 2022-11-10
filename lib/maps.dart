import 'package:flutter/material.dart';
import 'package:provisions/main.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';

const kGoogleApiKey = "AIzaSyB60rEfnkN6QZNkD5GOUuTcLV4w-Qa5ZPM";
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);


class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => MapsPageState();
} //MyHomePage

class MapsPageState extends State<MapsPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(46.8188, -92.0843);

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  late String address;


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
      infoWindow: InfoWindow(
          title: 'Buffalo Wild Wings', snippet: 'I like the tap water'),
    );

    setState(() {
      // adding a new marker to map
      markers[const MarkerId('Tavern')] = marker;
      markers[const MarkerId('PhoHolic')] = marker2;
      markers[const MarkerId('Buffalo Wild Wings')] = marker3;
    }); //setState

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120.0),
            child: AppBar(
              centerTitle: true,
              title: const Text('Provisions'),
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
                        onTap:
                            () async {
                          //Prediction p = await PlacesAutocomplete.show(context: context, apiKey: kGoogleApiKey);
                          //displayPrediction(p);
                        },
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
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
                markers: markers.values.toSet(),
              ),
            ],
          )
      ),
    );
  }
}// Widget

  Future<void> displayPrediction(Prediction p) async {
    PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId!);

    var placeID = p.placeId;
    double? lat = detail.result.geometry?.location.lat;
    double? lng = detail.result.geometry?.location.lng;
    var address = await Geocoder.local.findAddressesFromQuery(p.description);
    print(lat);
    print(lng);
} // MapsPageState
