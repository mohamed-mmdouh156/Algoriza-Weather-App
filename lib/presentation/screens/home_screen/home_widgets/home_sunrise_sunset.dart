import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/presentation/styles/colors_manager.dart';
import 'package:weather_app/presentation/widgets/text_style_manager.dart';

class HomeSunriseAndSunset extends StatelessWidget {
  final WeatherModel? weatherModel;
  const HomeSunriseAndSunset({
    required this.weatherModel,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5.0,
      ),
      child: Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
              color: ColorManager.containerColor,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Sunrise',
                      style: defaultTextStyle(17, ColorManager.white,fontWeight: FontWeight.w900)
                  ),
                  const SizedBox(height: 5,),
                  Text(
                      '${weatherModel!.forecast!.forecastday![0].astro!.sunrise}',
                      style: defaultTextStyle(14, ColorManager.white,fontWeight: FontWeight.w400)
                  ),
                  Lottie.network(
                      'https://assets9.lottiefiles.com/packages/lf20_84jxyn2u.json',
                      height: 90,
                      width: 90
                  )
                ],
              ),
              const SizedBox(width: 40,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Sunset',
                      style: defaultTextStyle(17, ColorManager.white,fontWeight: FontWeight.w900)
                  ),
                  const SizedBox(height: 5,),
                  Text(
                      '${weatherModel!.forecast!.forecastday![0].astro!.sunset}',
                      style: defaultTextStyle(14, ColorManager.white,fontWeight: FontWeight.w400)
                  ),
                  Lottie.network(
                      'https://assets7.lottiefiles.com/packages/lf20_5opuln2d.json',
                      height: 90,
                      width: 90
                  )
                ],
              ),
            ],
          )
      ),
    );
  }
}
