import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/business_logic/weather_cubit/weather_cubit.dart';
import 'package:weather_app/presentation/screens/home_screen/home_screen.dart';
import 'package:weather_app/presentation/styles/colors_manager.dart';
import 'package:weather_app/presentation/views/carousel_slider_view.dart';
import 'package:weather_app/presentation/widgets/text_style_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static double lat = 0;
  static double long = 0;

  @override
  void initState() {
    super.initState();
    locationService();
  }


  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.network(
                  'https://assets6.lottiefiles.com/private_files/lf30_jmgekfqg.json',
                  height: 300,
                  width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                  'Today Weather',
                  style: defaultTextStyle(30, ColorManager.white , fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> locationService() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionLocation;
    LocationData locData;

    serviceEnabled = await location.serviceEnabled();
    if(!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionLocation = await location.hasPermission();
    if(permissionLocation == PermissionStatus.denied) {
      permissionLocation = await location.requestPermission();
      if(permissionLocation != PermissionStatus.granted) {
        return;
      }
    }

    locData = await location.getLocation();

    setState(() {
      lat = locData.latitude!;
      long = locData.longitude!;
    });

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => HomeScreen(lat: lat,lon: long,)));
    });
  }




}