import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import './location_service.dart';
import './new_menstrual_icons_icons.dart';

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

  Set<Marker> markers = Set();
  Set<Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPIKey = 'AIzaSyAi9LUQc127AeXYJGrV7Ib24FFw64o-C2w';

    // ignore: prefer_const_declarations
  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  TextEditingController _searchController = TextEditingController();
  bool flag = false;
  bool pageRequestedFlag = false;
  dynamic pageRequestedResults;
  dynamic pageRequestedAllResults;

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

  void setRouteMarkers(origin, destination) {
    setState(() {
      markers.add(Marker( //add first marker
        markerId: MarkerId('Origin'),
        position: LatLng(origin.latitude, origin.longitude), //position of marker
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker( //add first marker
        markerId: MarkerId('Destination'),
        position: LatLng(destination.latitude, destination.longitude), //position of marker
        icon: BitmapDescriptor.defaultMarkerWithHue(90), //Icon for Marker
      ));
    });
  }

  setPolylines(origin, destination) async {
    var result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPIKey,
      PointLatLng(origin.latitude, origin.longitude),
      PointLatLng(destination.latitude, destination.longitude));

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    setState(() {
      Polyline polyline = Polyline(
          polylineId: PolylineId("poly"),
          color: Color.fromARGB(255, 3, 58, 90),
          points: polylineCoordinates);

      polylines.add(polyline);
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
    
    markers = Set();
    polylines = {};
    polylineCoordinates = [];
    setMarker(result);
  }

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
            polylines: polylines,
              
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
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 243, 239, 239),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        controller: controller,
        children: <Widget>[
          SizedBox(height: 15,),

          buildDragHandle(),

          if (pageRequestedFlag) ...[
            SizedBox(height: 5,),
            pageWidget(pageRequestedResults, pageRequestedAllResults)
          ] 
          
          else ...[
            slidingPanelHome(),
          ],

          SizedBox(height: 24,),
        ],
  ),
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

  Widget slidingPanelHome() => Container(
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
                // print(value);
              },
            )),
            InkWell(child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 237, 211, 210),
                borderRadius: BorderRadius.circular(12)
              ),
              width: 89, 
              height: 38, 
              padding: const EdgeInsets.all(10),
              child: Text('Clear Map', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black))),
            onTap: () {
              setState(() {
                markers = Set();
                polylines = {};
              });
            },
          )],),
          
          SizedBox(height: 20,),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 2, 42, 59),
                shape: BoxShape.circle
              ),
              child: IconButton(onPressed: () => search("sanitary pads"), icon: Icon(NewMenstrualIcons.pad, color: Color.fromARGB(255, 255, 255, 255),), iconSize: 40,)
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 2, 42, 59),
                shape: BoxShape.circle
              ),
              child: IconButton(onPressed: () => search("tampon"), icon: Icon(NewMenstrualIcons.tampon, color: Color.fromARGB(255, 255, 255, 255),), iconSize: 40,)
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 2, 42, 59),
                shape: BoxShape.circle
              ),
              child: IconButton(onPressed: () => search("contraception"), icon: Icon(NewMenstrualIcons.birthcontrol, color: Color.fromARGB(255, 255, 255, 255),), iconSize: 40,)
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 2, 42, 59),
                shape: BoxShape.circle
              ),
              child: IconButton(onPressed: () => search("pharmacy"), icon: Icon(NewMenstrualIcons.stethoscope, color: Color.fromARGB(255, 255, 255, 255),), iconSize: 40,)
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 2, 42, 59),
                shape: BoxShape.circle
              ),
              child: IconButton(onPressed: () => search("doctor"), icon: Icon(NewMenstrualIcons.family, color: Color.fromARGB(255, 255, 255, 255),), iconSize: 40,)
            ),
          ],),

          SizedBox(height: 20,),

          Text('  Near Me', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Color.fromARGB(255, 2, 42, 59))),

          SizedBox(height: 10,),

          if (flag) ...[

            Column(
              children: [
                for (var i = 0; i < 5; i++) nearBy(i), 
              ],
            ),
          ],
          
      ],
    ),
  );

  Widget nearBy(i) => Container(
    width: double.infinity, 
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 237, 211, 210),
      border: Border.all(
        color: Color.fromARGB(255, 237, 211, 210),
      ),
      borderRadius: BorderRadius.all(Radius.circular(20))
    ),
    child: Padding(padding: EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          Text(pharmacies[i]['name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color.fromARGB(255, 2, 42, 59))),
          SizedBox(height: 15,),
          Text(pharmacies[i]['formatted_address'], style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 2, 42, 59))),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Distance: ' + getDistance(pharmacies[i]['geometry']['location']['lat'], pharmacies[i]['geometry']['location']['lng']) + ' • Rating: ' + pharmacies[i]['rating'].toString(), style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 2, 42, 59))),
            IconButton(onPressed: () => pageRequested(pharmacies[i], pharmacies), icon: Icon(Icons.arrow_forward, size: 25,))
          ],)
      ]),
    ),
  );

  pageRequested(results, allResults) {
    // print(results);
    // print(results.keys.toList()..sort());
    setState(() {
      pageRequestedFlag = true;
      pageRequestedResults = results;
      pageRequestedAllResults = allResults;
    });
  }
  
  homeRequested() {
    setState(() {
      pageRequestedFlag = false;
    });
  }

  var defaultHours = [
    "Monday: 9:00 AM - 10:00 PM",
    "Tuesday: 9:00 AM - 10:00 PM",
    "Wednesday: 9:00 AM - 10:00 PM",
    "Thursday: 9:00 AM - 10:00 PM",
    "Friday: 9:00 AM - 10:00 PM",
    "Saturday: 9:00 AM - 10:00 PM",
    "Sunday: 9:00 AM - 10:00 PM",
  ];

  Widget pageWidget(results, allResults) => Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(children: [
          IconButton(onPressed: () => homeRequested(), icon: Icon(Icons.arrow_back, size: 25,)),
          
          Flexible(
            child: Text(results['name'], maxLines: 2, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Color.fromARGB(255, 2, 42, 59))),
          )
        ],),

        SizedBox(height: 10,),

        Text('     Sanitary Products   •   ' + getDistance(results['geometry']['location']['lat'], results['geometry']['location']['lng']) + '   •   ' + results['rating'].toString() + ' ☆   •   ' + getStars(results), 
          style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 2, 42, 59))),

        InkWell(
          child: Container(
            width: double.infinity, 
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 2, 42, 59),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  SizedBox(height: 10,),
                  Text('Directions', style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 255, 255, 255))),
                  SizedBox(height: 10,),
                ]),
          ),
          onTap: () {
              print('can you see me');
              markers = Set();
              polylines = {};
              polylineCoordinates = [];
              setRouteMarkers(
                LatLng(currentPosition.latitude, 
                      currentPosition.longitude),
                LatLng(results['geometry']['location']['lat'], 
                      results['geometry']['location']['lng']));
              setPolylines(
                LatLng(currentPosition.latitude, 
                      currentPosition.longitude),
                LatLng(results['geometry']['location']['lat'], 
                      results['geometry']['location']['lng']));}
        ),

        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 100, 
            margin: const EdgeInsets.all(5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 240, 229, 229),
              borderRadius: BorderRadius.circular(12)
            ),
            child: InkWell(child: Column(crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
                SizedBox(height: 10,),
                Icon(Icons.phone),
                SizedBox(height: 10,),
                Text('Call', style: TextStyle(fontSize: 18, color: Colors.black)),
                SizedBox(height: 10,),
              ]),
              onTap: () async {
                var number = results['formatted_phone_number'];
                launch('tel://$number');
              })
          ),

          Container(
            width: 100, 
            margin: const EdgeInsets.all(5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 240, 229, 229),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                Icon(Icons.bookmark),
                SizedBox(height: 10,),
                Text('Bookmark', style: TextStyle(fontSize: 18, color: Colors.black)),
                SizedBox(height: 10,),
              ])
          ),

          Container(
            width: 100, 
            margin: const EdgeInsets.all(5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 240, 229, 229),
              borderRadius: BorderRadius.circular(12)
            ),
            child: InkWell(child: Column(crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
                SizedBox(height: 10,),
                Icon(Icons.language),
                SizedBox(height: 10,),
                Text('More', style: TextStyle(fontSize: 18, color: Colors.black)),
                SizedBox(height: 10,),
              ]),
              onTap: () async {
                var website = results['website'];
                launch(website);
              })
          )
        ],),

        SizedBox(height: 10,),

        Text('   Hours', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),

        SizedBox(height: 5,),

        if (results.containsKey('opening_hours') &&  results['opening_hours'].containsKey('weekday_text')) ...[
          for (var i = 0; i < results['opening_hours']['weekday_text'].length; i++) Text('   ' + results['opening_hours']['weekday_text'][i], style: TextStyle(fontSize: 16, color: Colors.black)), 
        ]
        else ...[
          for (var i = 0; i < defaultHours.length; i++) Text('   ' + defaultHours[i], style: TextStyle(fontSize: 16, color: Colors.black)), 
        ],

        SizedBox(height: 15,),

        Text('   Address', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),

        SizedBox(height: 5,),

        Padding(padding: EdgeInsets.only(left:13), child:
          Text(results['formatted_address'], style: TextStyle(fontSize: 16, color: Colors.black)),),

        SizedBox(height: 15,),

        Text('   Useful to Know', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),

        Padding(padding: EdgeInsets.only(left:13), child:
          Column(children: [
            for (var i in ['Sanitary Pads', 'Tampons', 'Pregnancy Test', 'Condoms']) Row(children: [Icon(Icons.check), Text('  ' + i, style: TextStyle(fontSize: 16, color: Colors.black))]), 
            Row(children: [
              Icon(Icons.close),
              Text('  Available Medical Professionals', style: TextStyle(fontSize: 16, color: Colors.black)),
            ],),
          ],)
        ),

        SizedBox(height: 15,),

        Text('   Similar Locations', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),

        Padding(padding: EdgeInsets.only(left:13, right: 13), child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: 
          Row(children: [
            for (var i=0; i<5; i++)
            if (allResults[i]!=results) ...[
            Padding(padding: EdgeInsets.only(right: 13), child: InkWell(child: Container(
              width: 200,
              height: 115, 
              margin: const EdgeInsets.only(top: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 229, 229),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, 
                children: [
                  SizedBox(height: 10,),
                  Padding(padding: EdgeInsets.only(left: 5, right: 5) ,child: Text(allResults[i]['name'], textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.black))),
                  SizedBox(height: 10,),
                  Text(getDistance(allResults[i]['geometry']['location']['lat'], allResults[i]['geometry']['location']['lng']) + ' • Rating: ' + allResults[i]['rating'].toString(), style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 2, 42, 59))),
                  SizedBox(height: 10,),
                ]),
            ),
            onTap: () => pageRequested(allResults[i], allResults)),)
            ]
          ],)
        ))
      ])
  );

  String getStars(results) {
    var level = results['price_level'];

    if (results.containsKey('price_level')) {
      if (level == 0) {
        return '\$';
      }

      else {
        return '\$'*level;
      }
    }

    return '\$';
  }
}