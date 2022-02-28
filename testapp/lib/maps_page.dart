import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import './location_service.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {

  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController newGoogleMapController;

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  late Position currentPosition;
  var geoLocator = Geolocator();

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLangPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition = CameraPosition(target: latLangPosition, zoom: 14);
    newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  // ignore: prefer_const_declarations
  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  // ignore: prefer_const_declarations
  static final CameraPosition _kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      // tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
      body: Column(children: [
        Expanded(
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
              
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              newGoogleMapController = controller;
        
              locatePosition();
            },
          ),
        ),
        Row(children: [
          IconButton(
            onPressed: () async {
              Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
              var place = LocationService().getPlace(_searchController.text, position.latitude, position.longitude);
              CameraPosition cameraPosition = CameraPosition(target: await place, zoom: 14);
              newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  
            }, 
            icon: Icon(Icons.search),),
          Expanded(child: TextFormField(
            controller: _searchController,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(hintText: 'Search Maps'),
            onChanged: (value) {
              print(value);
            },
          )),
        ],),
      ],), 
      floatingActionButton: FloatingActionButton.extended(
          onPressed: locatePosition,
          label: const Text('My Location'),
          icon: const Icon(Icons.location_history),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
    );
  }
}