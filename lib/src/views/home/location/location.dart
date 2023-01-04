import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  Completer<GoogleMapController> _controller = Completer();
  // ignore: prefer_const_declarations
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  );

  List<Marker> _marker = [];
  List<Marker> list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(20.42796133580664, 80.885749655962),
        infoWindow: InfoWindow(title: 'my CurrentLocation'))
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(list);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGoogle,
          markers: Set<Marker>.of(_marker),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          myLocationEnabled: true,
          mapType: MapType.normal,
          compassEnabled: true,
        ),
      ),
    );
  }
}
