import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationTrackingScreen extends StatefulWidget {
  @override
  _LocationTrackingScreenState createState() => _LocationTrackingScreenState();
}

class _LocationTrackingScreenState extends State<LocationTrackingScreen> {
  late GoogleMapController _mapController;
  final LatLng _initialPosition = LatLng(37.7749, -122.4194); // Example coordinates (San Francisco)
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    // Adding a marker at the initial car location (example position)
    _markers.add(
      Marker(
        markerId: const MarkerId('carLocation'),
        position: _initialPosition,
        infoWindow: InfoWindow(title: 'Car Location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Location Tracking'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 14.0,
        ),
        markers: _markers,
        myLocationEnabled: true, // Enables the "My Location" button
        myLocationButtonEnabled: true, // Adds "My Location" button on the map
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _centerMapOnCar,
        child: Icon(Icons.location_searching),
        tooltip: 'Center on Car',
      ),
    );
  }

  void _centerMapOnCar() {
    _mapController.animateCamera(
      CameraUpdate.newLatLng(_initialPosition),
    );
  }
}
