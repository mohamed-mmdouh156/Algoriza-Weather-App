import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/presentation/styles/assets_manager.dart';
import 'package:weather_app/presentation/styles/colors_manager.dart';
import 'package:weather_app/presentation/widgets/text_style_manager.dart';

class HomeNextDaysTemp extends StatelessWidget {
  final WeatherModel? weatherModel;
  const HomeNextDaysTemp({
    required this.weatherModel,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var daysContainerSize = weatherModel!.forecast!.forecastday!.length * MediaQuery.of(context).size.height * 0.04;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5.0,
      ),
      child: Container(
        height: daysContainerSize,
        width: double.infinity,
        decoration: BoxDecoration(
            color: ColorManager.containerColor,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context,index) =>nextDaysTempListItem(weatherModel, index),
            separatorBuilder: (context,index) => const SizedBox(height: 10,),
            itemCount: weatherModel!.forecast!.forecastday!.length,
          ),
        ),
      ),
    );
  }

  Widget nextDaysTempListItem (WeatherModel? weatherModel , int index) => Stack(
    alignment: AlignmentDirectional.centerEnd,
    children: [
      Positioned(
        left: 10,
        child: Text(
            DateFormat('EEEE').format(DateTime.parse((weatherModel!.forecast!.forecastday![index].date)!)),
            style: defaultTextStyle(
              14,
              ColorManager.white, fontWeight: FontWeight.w500,
            )
        ),
      ),
      const Positioned(
        left: 95,
        child: Image(
          height: 15,
          width: 15,
          image: AssetImage(AssetsManager.rainIcon),
        ),
      ),
      Positioned(
        left: 110,
        child: Text(
            '${weatherModel.forecast!.forecastday![index].day!.dailyChanceOfRain}%',
            style: defaultTextStyle(14, ColorManager.whiteDark,)
        ),
      ),
      Text(
          '${weatherModel.forecast!.forecastday![index].day!.mintempC}\u00B0',
          style: defaultTextStyle(15, ColorManager.white,fontWeight: FontWeight.w500,)
      ),
      const Positioned(
        left: 140,
        child: Image(
          height: 30,
          width: 30,
          image: AssetImage(AssetsManager.sunIcon),
        ),
      ),
      Positioned(
        right: 40,
        child: Text(
            '${weatherModel.forecast!.forecastday![index].day!.maxtempC}\u00B0',
            style: defaultTextStyle(15, ColorManager.white,fontWeight: FontWeight.w500,)
        ),
      ),
      const Positioned(
        right: 85,
        child: Image(
          height: 20,
          width: 20,
          image: AssetImage(AssetsManager.moonIcon),
        ),
      ),
    ],
  );
}
