import 'package:evently/data/location_manager.dart';
import 'package:evently/ui/utills/dialog_utilites.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTab extends StatefulWidget {
  const MapTab({super.key});

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  late GoogleMapController _controller;
  bool _mapReady = false;
  var intialPosition = CameraPosition(zoom: 14, target: LatLng(30.0, 31.0));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            var location = await LocationManager.getCurrentLocation();

            // Update marker position so UI reflects new location
            setState(() {
              intialPosition = CameraPosition(
                zoom: 14,
                target: LatLng(location.latitude, location.longitude),
              );
            });

            // If map is ready, animate camera to the new location
            if (_mapReady) {
              await _controller.animateCamera(
                CameraUpdate.newLatLng(
                  LatLng(location.latitude, location.longitude),
                ),
              );
            }
          } catch (e) {
            // Show a friendly message when location cannot be retrieved
            showMessege(
              context,
              title: 'Location error',
              content: e.toString(),
              posButtonTitle: 'OK',
            );
          }
        },
        child: Icon(Icons.my_location),
      ),
      body: GoogleMap(
        zoomControlsEnabled: false,
        markers: {
          Marker(
            markerId: MarkerId("1"),
            position: intialPosition.target,
          ),
        },
        onTap: (argument){
          intialPosition = CameraPosition(zoom: 14, target: argument);
          _controller.animateCamera(
            CameraUpdate.newLatLng(
              argument,
            ),
          );
          setState(() {
            
          });
        },
        onMapCreated: (controller) {
          _controller = controller;
          _mapReady = true;
        },
        initialCameraPosition: intialPosition,
      ),
    );
  }
}
