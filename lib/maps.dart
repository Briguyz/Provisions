import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
//import 'package:permission/permission.dart';
import 'package:provider/provider.dart';
import 'package:provisions/blocs/application_bloc.dart';
import 'package:provisions/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:provisions/models/place.dart';
import 'package:provisions/services/places_service.dart';



// --no-sound-null-safety  <-- arg for .dart file launch configurations

const kGoogleApiKey = "AIzaSyB60rEfnkN6QZNkD5GOUuTcLV4w-Qa5ZPM";




class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => MapsPageState();

} //MyHomePage

class MapsPageState extends State<MapsPage> {

  Completer<GoogleMapController> _mapController = Completer();
  late StreamSubscription locationSubscription;


  @override
  void initState() {
    final applicationBloc = Provider.of<ApplicationBloc>(context, listen: false);

    locationSubscription = applicationBloc.selectedLocation.stream.listen((place) {
      if (place != null){
        _goToPlace(place);
      }
    });
    super.initState();
  }

  @override
  void dispose(){
    final applicationBloc = Provider.of<ApplicationBloc>(context, listen: false);
    applicationBloc.dispose();
    locationSubscription.cancel();
    super.dispose();
  }

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

    PlacesService placesService = PlacesService();
    final applicationBloc = Provider.of<ApplicationBloc>(context);
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
                      child:
                      TextField(
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
                        onChanged: (value) => applicationBloc.searchPlaces(value),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          body:
          Stack(
            children: <Widget>[
              GoogleMap(
                padding: const EdgeInsets.only(top: 400.0),
                mapType: MapType.normal,
                myLocationEnabled: true, // need to hard code this if want to appear after initial viewing
                myLocationButtonEnabled: true,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 5.0,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _mapController.complete(controller);
                  //locatePosition();
                },
      ),
              if (applicationBloc.searchResults.isNotEmpty)
                Container(
                  height: 300.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.6),
                    backgroundBlendMode: BlendMode.darken,
                  ),
                ),
              Container(
                height: 300.0,
                child:
                  ListView.builder(
                    itemCount: applicationBloc.searchResults.length,
                    itemBuilder: (context, index){
                      return ListTile(
                          title:
                            Text(
                              applicationBloc.searchResults[index].description,
                              style: const TextStyle(color: Colors.white)
                            ),
                        onTap: () {
                          applicationBloc.setSelectedLocation(
                            applicationBloc.searchResults[index].placeId
                          );
                        },
                      );
                    },
                  ),
              ),
            ],
          ),
      ),
    );
  } //build
  Future<void> _goToPlace(Place place) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(place.geometry.location.lat, place.geometry.location.lng), zoom: 14
        )
      )
    );
  }
}// Widget


