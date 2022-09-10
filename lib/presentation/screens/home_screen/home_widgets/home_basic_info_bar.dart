import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/business_logic/weather_cubit/weather_cubit.dart';
import 'package:weather_app/business_logic/weather_cubit/weather_states.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/presentation/styles/colors_manager.dart';
import 'package:weather_app/presentation/widgets/text_style_manager.dart';

class HomeBasicInfoBar extends StatelessWidget {
  final WeatherModel? weatherModel;
  const HomeBasicInfoBar({
    required this.weatherModel,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit , WeatherStates>(
      listener: (context , state){},
      builder: (context , state){
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 35
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:  [
                  Text(
                      '${weatherModel!.current!.tempC}'+'\u00B0',style: defaultTextStyle(60, ColorManager.white)
                  ),
                  const Spacer(),
                  Lottie.network(
                      'https://assets7.lottiefiles.com/packages/lf20_mwnl7iyc.json',
                      height: 70,
                      width: 70
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Row(
                children: [
                  const SizedBox(height: 50,),
                  Text(
                      '${weatherModel!.location!.name}',
                      style: defaultTextStyle(30, ColorManager.white)
                  ),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(
                        Icons.location_on,
                        color: ColorManager.white,
                      )
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Row(
                    children: [
                      Text(
                          '${weatherModel!.forecast!.forecastday![0].day!.maxtempC}\u00B0',
                          style: defaultTextStyle(17, ColorManager.white,fontWeight: FontWeight.w500)
                      ),
                      Text(
                          '/',
                          style: defaultTextStyle(17, ColorManager.white,fontWeight: FontWeight.w500)
                      ),
                      Text(
                          '${weatherModel!.forecast!.forecastday![0].day!.mintempC}\u00B0',
                          style: defaultTextStyle(17, ColorManager.white,fontWeight: FontWeight.w500)
                      ),
                      Text(
                          ' Feels like ${weatherModel!.current!.feelslikeC}\u00B0',
                          style: defaultTextStyle(17, ColorManager.white,fontWeight: FontWeight.w500)
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Row(
                    children: [
                      Text(
                          DateFormat('EE, HH:mm').format(DateTime.now()),
                          style: defaultTextStyle(15, ColorManager.white,fontWeight: FontWeight.w500)
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
