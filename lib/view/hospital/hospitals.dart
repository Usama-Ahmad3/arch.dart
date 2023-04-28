import 'dart:async';

import 'package:docter_app/res/drawer/drawer.dart';
import 'package:docter_app/res/widgets/inputFormField.dart';
import 'package:docter_app/utils/colors/colors.dart';
import 'package:docter_app/utils/toast-messages/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'textFormFieldProvider.dart';

class Hospitals extends StatefulWidget {
  const Hospitals({Key? key}) : super(key: key);

  @override
  State<Hospitals> createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  final Completer<GoogleMapController> _completer = Completer();
  String address = '';
  LatLng coordinates = LatLng(30.0346038, 72.3164137);

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Utils.toastMessage('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Utils.toastMessage('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Utils.toastMessage('Permission Denied permanently');
    }
  }

  Future<void> _getAddressFromCoordinates() async {
    try {
      Position position;
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          forceAndroidLocationManager: true);
      coordinates = LatLng(position.latitude, position.longitude);
      List<Placemark> placemarks = await placemarkFromCoordinates(
          coordinates.latitude, coordinates.longitude);
      Placemark place = placemarks[0];
      address = "${place.subLocality} ${place.locality}";
    } catch (e) {
      Utils.toastMessage(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _determinePosition();
    _getAddressFromCoordinates();
  }

  @override
  Widget build(BuildContext context) {
    print('usama');
    final providerContext = Provider.of<textFormField>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FlexColor.deepPurpleLightTertiary,
        title: const Text('Hospitals'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.04,
          ),
        ],
      ),
      drawer: const Drawerr(),
      backgroundColor: FlexColor.lightScaffoldBackground,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width * .91,
              decoration: BoxDecoration(
                  color: FlexColor.deepPurpleLightTertiary,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const FaIcon(FontAwesomeIcons.xmark))
                    ],
                  ),
                  Row(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0, bottom: 8),
                          child: CircleAvatar(
                            backgroundColor: FlexColor.lightSurfaceOrg,
                            maxRadius: 33,
                            child: Text(
                              'Hospital',
                              style: TextStyle(color: FlexColor.black),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 8, right: 8, bottom: 8),
                          child: Consumer<textFormField>(
                            builder: (context, value, child) {
                              return InputTextField(
                                hint: 'Search Hospitals',
                                keyboardType: TextInputType.name,
                                myController: value.controller,
                                focusNode: value.focus,
                                obscureText: false,
                                onValidator: (_) {},
                                onFileSubmittedValue: (_) {},
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                      child: GoogleMap(
                    initialCameraPosition:
                        CameraPosition(target: coordinates, zoom: 12),
                    onMapCreated: (GoogleMapController controller) {
                      _completer.complete(controller);
                    },
                    onTap: (val) async {
                      coordinates = LatLng(val.latitude, val.longitude);
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(
                              coordinates.latitude, coordinates.longitude);
                      Placemark place = placemarks[0];
                      address = "${place.subLocality} ${place.locality}";
                      providerContext.controller.text = address;
                      setState(() {});
                    },
                    markers: <Marker>{
                      Marker(
                          markerId: const MarkerId('1'),
                          position: coordinates,
                          infoWindow: InfoWindow(
                            title: address,
                          ))
                    },
                    mapType: MapType.normal,
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
