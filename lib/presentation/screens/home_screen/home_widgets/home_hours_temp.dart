import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/presentation/styles/assets_manager.dart';
import 'package:weather_app/presentation/styles/colors_manager.dart';
import 'package:weather_app/presentation/widgets/text_style_manager.dart';

class HomeHoursTemp extends StatelessWidget {
  final WeatherModel? weatherModel;

  const HomeHoursTemp({
    required this.weatherModel,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Container(
          height: MediaQuery.of(context).size.height *0.15,
          width: double.infinity,
          decoration: BoxDecoration(
              color: ColorManager.containerColor,
              borderRadius: BorderRadius.circular(15)
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index)=> hoursTempListItem(weatherModel , index),
            separatorBuilder: (context , index) =>const SizedBox(width: 2,),
            itemCount: weatherModel!.forecast!.forecastday![0].hour!.length,
          )
      ),
    );
  }


  Widget hoursTempListItem (WeatherModel? weatherModel , int index){
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                '$index:00',
                style: defaultTextStyle(13, ColorManager.white,fontWeight: FontWeight.w500)
            ),
            const SizedBox(height: 5,),
            const Image(
              height: 25,
              width: 25,
              image: AssetImage(AssetsManager.sunIcon),
            ),
            Text(
                '${weatherModel!.forecast!.forecastday![0].hour![index].tempC}',
                style: defaultTextStyle(13, ColorManager.white,fontWeight: FontWeight.w500)
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Row(
                children: [
                  const Image(
                    height: 20,
                    width: 20,
                    image: AssetImage(AssetsManager.rainIcon),
                  ),
                  const SizedBox(width: 2,),
                  Text(
                      '${weatherModel.forecast!.forecastday![0].hour![index].chanceOfRain}',
                      style: defaultTextStyle(13, ColorManager.white,fontWeight: FontWeight.w500)
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
