import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewMap extends StatefulWidget {
  ViewMap({Key? key}) : super(key: key);

  @override
  _ViewMapState createState() => _ViewMapState();
}

class _ViewMapState extends State<ViewMap> {

  Set<Marker> _markers = Set<Marker>();

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _initialCamperaPosition = CameraPosition(
    target: LatLng(-0.9335863141754581, -78.61500222658208),
    zoom: 18.5,
  );

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: false,
        title: Text('Google Maps'),),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialCamperaPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _goToNewYork();
        },
        markers: _markers, 
        ),
    );
  }
  Future<void> _goToNewYork() async {
    double lat = 40.7128;
    String lat1 = '40.7128';
    double long = -74.0060;
    double _zoom = 18.5;
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(double.parse(lat1), long), _zoom));
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId('newyork'),
            position: LatLng(lat, long),
        ),
      );
    });
  }
 
}