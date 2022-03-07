import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import './location_service.dart';
import './menstrual_icons_icons.dart';

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
  dynamic pharmacies;

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLangPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition = CameraPosition(target: latLangPosition, zoom: 14);
    newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    
    setState(() async {
      pharmacies = await LocationService().getPlace('pharmacy', position.latitude, position.longitude);
      flag = true;
    });
  }

  Set<Marker> markers = Set();

  void setMarker(dynamic result) {
    setState(() {
      for (var i = 0; i < result.length; i++) {
        markers.add(Marker( //add first marker
          markerId: MarkerId('Location' + i.toString()),
          position: LatLng(result[i]['geometry']['location']['lat'], result[i]['geometry']['location']['lng']), //position of marker
          infoWindow: InfoWindow( //popup info 
            title: result[i]['name'],
          ),
          icon: BitmapDescriptor.defaultMarker, //Icon for Marker
        ));
      }
    });
  }

  String getDistance(double lat2, double lon2) {
    var R = 6371; // Radius of the earth in km
    var dLat = (lat2-currentPosition.latitude) * pi/180;
    var dLon = (lon2-currentPosition.longitude) * pi/180; 
    var a =
      sin(dLat/2) * sin(dLat/2) +
      cos((currentPosition.latitude) * pi/180) * cos((lat2) * pi/180) * 
      sin(dLon/2) * sin(dLon/2); 
    var c = 2 * atan2(sqrt(a), sqrt(1-a)); 
    var d = R * c; // Distance in km
    d = double.parse((d).toStringAsFixed(2));
    return d.toString() + ' km';
  }

  void search(String textToSearch) async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var result = await LocationService().getPlace(textToSearch, position.latitude, position.longitude);
    
    Set<Marker> markers = Set();
    setMarker(result);
  }

  // ignore: prefer_const_declarations
  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  TextEditingController _searchController = TextEditingController();
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
      body: SlidingUpPanel(
        minHeight: 80,
        maxHeight: MediaQuery.of(context).size.height*0.8,
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
        parallaxEnabled: true,
        parallaxOffset: 0.5,

        body: 
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            markers: markers,
              
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              newGoogleMapController = controller;
        
              locatePosition();
            },
          ),

          panelBuilder: (controller) => PanelWidget(controller),
        ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: locatePosition,
          label: const Text('My Location'),
          icon: const Icon(Icons.location_history),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
    );
  }

  Widget PanelWidget(ScrollController controller) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: controller,
      children: <Widget>[
        SizedBox(height: 15,),

        buildDragHandle(),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Row(children: [
                  IconButton(
                    onPressed: () => search(_searchController.text), 
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
                
                SizedBox(height: 20,),

                Row(children: [
                  IconButton(onPressed: () => search("sanitary pads"), icon: Icon(MenstrualIcons.pad),          iconSize: 40,),
                  IconButton(onPressed: () => search("tampons"), icon: Icon(MenstrualIcons.tampon),       iconSize: 40,),
                  IconButton(onPressed: () => search("contraception"), icon: Icon(MenstrualIcons.pills),        iconSize: 40,),
                  IconButton(onPressed: () => search("condoms"), icon: Icon(MenstrualIcons.condom),       iconSize: 40,),
                  IconButton(onPressed: () => search("pharmacy"), icon: Icon(MenstrualIcons.pharmacy),     iconSize: 40,),
                  IconButton(onPressed: () => search("doctor"), icon: Icon(MenstrualIcons.sthethoscope), iconSize: 40,),
                ],),

                SizedBox(height: 20,),

                Text('  Near Me', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Color.fromARGB(255, 2, 42, 59))),

                SizedBox(height: 10,),

                if (flag) ...[
                  Container(
                    width: double.infinity, 
                    margin: const EdgeInsets.all(10),
                    color: Color.fromARGB(255, 237, 211, 210),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
                      children: [
                        Text(pharmacies[0]['name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color.fromARGB(255, 2, 42, 59))),
                        SizedBox(height: 15,),
                        Text(pharmacies[0]['formatted_address'], style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 2, 42, 59))),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text('Distance: ' + getDistance(pharmacies[0]['geometry']['location']['lat'], pharmacies[0]['geometry']['location']['lng']) + '  |  Rating: ' + pharmacies[0]['rating'].toString(), style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 2, 42, 59))),
                          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward, size: 25,))
                        ],)
                    ]),),

                    Container(
                    width: double.infinity, 
                    margin: const EdgeInsets.all(10),
                    color: Color.fromARGB(255, 237, 211, 210),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
                      children: [
                        Text(pharmacies[1]['name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color.fromARGB(255, 2, 42, 59))),
                        SizedBox(height: 15,),
                        Text(pharmacies[1]['formatted_address'], style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 2, 42, 59))),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text('Distance: ' + getDistance(pharmacies[1]['geometry']['location']['lat'], pharmacies[1]['geometry']['location']['lng']) + '  |  Rating: ' + pharmacies[1]['rating'].toString(), style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 2, 42, 59))),
                          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward, size: 25,))
                        ],)
                    ]),),

                    Container(
                    width: double.infinity, 
                    margin: const EdgeInsets.all(10),
                    color: Color.fromARGB(255, 237, 211, 210),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
                      children: [
                        Text(pharmacies[2]['name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color.fromARGB(255, 2, 42, 59))),
                        SizedBox(height: 15,),
                        Text(pharmacies[2]['formatted_address'], style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 2, 42, 59))),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text('Distance: ' + getDistance(pharmacies[2]['geometry']['location']['lat'], pharmacies[2]['geometry']['location']['lng']) + '  |  Rating: ' + pharmacies[2]['rating'].toString(), style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 2, 42, 59))),
                          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward, size: 25,))
                        ],)
                    ]),),

                    Container(
                    width: double.infinity, 
                    margin: const EdgeInsets.all(10),
                    color: Color.fromARGB(255, 237, 211, 210),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
                      children: [
                        Text(pharmacies[3]['name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color.fromARGB(255, 2, 42, 59))),
                        SizedBox(height: 15,),
                        Text(pharmacies[3]['formatted_address'], style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 2, 42, 59))),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text('Distance: ' + getDistance(pharmacies[3]['geometry']['location']['lat'], pharmacies[3]['geometry']['location']['lng']) + '  |  Rating: ' + pharmacies[3]['rating'].toString(), style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 2, 42, 59))),
                          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward, size: 25,))
                        ],)
                    ]),),

                    Container(
                    width: double.infinity, 
                    margin: const EdgeInsets.all(10),
                    color: Color.fromARGB(255, 237, 211, 210),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
                      children: [
                        Text(pharmacies[4]['name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color.fromARGB(255, 2, 42, 59))),
                        SizedBox(height: 15,),
                        Text(pharmacies[4]['formatted_address'], style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 2, 42, 59))),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text('Distance: ' + getDistance(pharmacies[4]['geometry']['location']['lat'], pharmacies[4]['geometry']['location']['lng']) + '  |  Rating: ' + pharmacies[4]['rating'].toString(), style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 2, 42, 59))),
                          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward, size: 25,))
                        ],)
                    ]),),
                ],
                
            ],
          ),
        ),

        SizedBox(height: 24,),
      ],
  );   
  }

  Widget buildDragHandle() => Center(
    child: Container(
      width: 30,
      height: 5,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12)
      ),
    )
  );
}