import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/presentation/styles/assets_manager.dart';
import 'package:weather_app/presentation/styles/colors_manager.dart';
import 'package:weather_app/presentation/widgets/text_style_manager.dart';

class HomeMoreTempDetails extends StatelessWidget {
  final WeatherModel? weatherModel;
  const HomeMoreTempDetails({
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
                  const Image(
                    image: AssetImage(AssetsManager.uvIcon),
                    height: 45,
                    width: 45,
                  ),
                  const SizedBox(height: 5,),

                  Text(
                      'UV Index',
                      style: defaultTextStyle(18, ColorManager.white,fontWeight: FontWeight.w500)
                  ),
                  const SizedBox(height: 5,),
                  if(weatherModel!.current!.uv ==1 || weatherModel!.current!.uv ==2)
                    Text(
                        'Low',
                        style: defaultTextStyle(18, ColorManager.whiteDark,)
                    ),
                  if(weatherModel!.current!.uv ==3 || weatherModel!.current!.uv ==4 || weatherModel!.current!.uv ==5 )
                    Text(
                        'Moderate',
                        style: defaultTextStyle(18, ColorManager.whiteDark,)
                    ),
                  if(weatherModel!.current!.uv ==6 || weatherModel!.current!.uv ==7 )
                    Text(
                        'High',
                        style: defaultTextStyle(18, ColorManager.whiteDark,)
                    ),
                  if(weatherModel!.current!.uv ==8 || weatherModel!.current!.uv ==9 || weatherModel!.current!.uv ==10)
                    Text(
                        'Very High',
                        style: defaultTextStyle(18, ColorManager.whiteDark,)
                    ),
                  if(weatherModel!.current!.uv ==11 )
                    Text(
                        'Extreme',
                        style: defaultTextStyle(18, ColorManager.whiteDark,)
                    ),
                ],
              ),
              const SizedBox(width: 15),
              Container(
                color: ColorManager.whiteDark,
                height: 120,
                width: 1,
              ),
              const SizedBox(width: 15,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage(AssetsManager.windIcon),
                    height: 45,
                    width: 45,
                  ),
                  const SizedBox(height: 5,),
                  Text(
                      'Wind',
                      style: defaultTextStyle(18, ColorManager.white,fontWeight: FontWeight.w500)
                  ),
                  const SizedBox(height: 5,),
                  Text(
                      '${weatherModel!.current!.windKph} km/h',
                      style: defaultTextStyle(15, ColorManager.whiteDark,)
                  ),
                ],
              ),
              const SizedBox(width: 15),
              Container(
                color: ColorManager.whiteDark,
                height: 120,
                width: 1,
              ),
              const SizedBox(width: 15,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage(AssetsManager.humidityIcon),
                    height: 45,
                    width: 45,
                  ),
                  const SizedBox(height: 5,),
                  Text(
                      'Humidity',
                      style: defaultTextStyle(18, ColorManager.white,fontWeight: FontWeight.w500)
                  ),
                  const SizedBox(height: 5,),
                  Text(
                      '${weatherModel!.current!.humidity} %',
                      style: defaultTextStyle(18, ColorManager.whiteDark,)
                  ),
                ],
              ),

            ],
          )
      ),
    );
  }
}
