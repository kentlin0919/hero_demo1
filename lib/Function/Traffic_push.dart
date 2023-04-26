import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class TrafficPush extends StatefulWidget {
  TrafficPush({super.key});

  @override
  _TrafficPushState createState() => _TrafficPushState();
}

class _TrafficPushState extends State<TrafficPush> {
  var latitude = "";
  var longitude = "";
  var altitude = "";
  var speed = "";
  var address = "";
  String Location = 'location';

  Future<void> _updataPosition() async {
    Position position = await _determinePosition();
    List pm =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();
      altitude = position.altitude.toString();
      speed = position.speed.toString();
      address = pm[0].toString();
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Location,
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'latitude: ' + latitude,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'speed' + speed,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'address' + address,
            ),
            ElevatedButton(onPressed: _updataPosition, child: const Text('get'))
          ]),
    ));
  }
}
