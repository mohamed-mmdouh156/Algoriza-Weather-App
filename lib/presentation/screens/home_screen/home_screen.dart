
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/business_logic/weather_cubit/weather_cubit.dart';
import 'package:weather_app/business_logic/weather_cubit/weather_states.dart';
import 'package:weather_app/presentation/screens/home_screen/home_widgets/home_basic_info_bar.dart';
import 'package:weather_app/presentation/screens/home_screen/home_widgets/home_drawer.dart';
import 'package:weather_app/presentation/screens/home_screen/home_widgets/home_hours_temp.dart';
import 'package:weather_app/presentation/screens/home_screen/home_widgets/home_more_temp_details.dart';
import 'package:weather_app/presentation/screens/home_screen/home_widgets/home_next_day_temp.dart';
import 'package:weather_app/presentation/screens/home_screen/home_widgets/home_sunrise_sunset.dart';
import 'package:weather_app/presentation/screens/home_screen/home_widgets/towmorrow_temp.dart';
import 'package:weather_app/presentation/styles/assets_manager.dart';
import 'package:weather_app/presentation/styles/colors_manager.dart';
import 'package:weather_app/presentation/styles/icon_broken.dart';
import 'package:weather_app/presentation/widgets/text_style_manager.dart';

class HomeScreen extends StatefulWidget {
  double ?lat;
  double ?lon;

  HomeScreen({Key? key,required this.lon,required this.lat}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final bool pinned = true;
  final bool snap = false;
  final bool floating = false;
  String city ='';


  ScrollController controller = ScrollController();

  Future<void> getLocation() async {
    List<Placemark> placeMark = await placemarkFromCoordinates(widget.lat!,widget.lon!);

    setState(() {
      city = placeMark[0].subAdministrativeArea!;
      print(city);
    });
  }

  @override
  void initState() {
    super.initState();
     getLocation().then((value) {
      WeatherCubit.get(context).getWeatherData(city: city );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = WeatherCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          /// Home Drawer
          drawer: const HomeDrawer(),
          body: city != '' && cubit.weatherModel != null ? SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  /// Home basic Information bar
                  HomeBasicInfoBar(weatherModel: cubit.weatherModel!),
                  /// Home body
                  Column(
                    children: [
                      const SizedBox(height: 15,),
                      HomeHoursTemp(weatherModel: cubit.weatherModel!),
                      const HomeTomorrowTemp(),
                      HomeNextDaysTemp(weatherModel: cubit.weatherModel!),
                      HomeSunriseAndSunset(weatherModel: cubit.weatherModel!),
                      HomeMoreTempDetails(weatherModel: cubit.weatherModel!),
                      const SizedBox(height: 15,),
                    ],
                  ),
                ],
              ),
          ):const Center(
            child: CircularProgressIndicator(),
          )
        );
      },
    );
  }

}

