import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:herbafriend/src/model/cities_model.dart';
import 'package:herbafriend/src/service/cities_service.dart';

class ViewMap extends StatefulWidget {
  ViewMap({Key? key}) : super(key: key);

  @override
  _ViewMapState createState() => _ViewMapState();
}

class _ViewMapState extends State<ViewMap> {
  List<Cities> _cities = [];
  final CitiesService _citiesService = CitiesService();

  Set<Marker> _markers = Set<Marker>();

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _initialCamperaPosition = CameraPosition(
    target: LatLng(-0.9335863141754581, -78.61500222658208),
    zoom: 18.5,
  );

  

  @override
   void initState() {
    super.initState();
    print("inicio del Estado");
    _loadCities();
  }
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
     GoogleMapController controller = await _controller.future;
    _cities.forEach((element) { 
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId(element.nombre.toString()),
            infoWindow: InfoWindow(title: element.provincia),
            position: LatLng(element.latitud!.toDouble(), element.longitud!.toDouble()),
        ),
      );
    });
    });
  }

   _loadCities(){
    _citiesService.getCities().then((value) {
      print(value.toString());
      _cities = value;
      setState(() {});
    });
  }
 
}