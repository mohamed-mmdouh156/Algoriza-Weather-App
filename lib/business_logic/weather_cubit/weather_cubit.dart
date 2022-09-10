import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/business_logic/weather_cubit/weather_states.dart';
import 'package:weather_app/constants/end_points.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/shared/remote/dio_helper.dart';

class WeatherCubit extends Cubit<WeatherStates>{

  WeatherCubit() : super(InitialState());

  static WeatherCubit get(context)=> BlocProvider.of(context);


  WeatherModel ?weatherModel;

  Future getWeatherData({
    required String city
   }) async{
    emit(GetWeatherDataSuccessState());
    DioHelper.getDate(
        url:WEATHER_DATA,
        query: {
          'key':'3abc4ac71f114deb86380405201809',
          'q':'Benha',
          'days':'12',
          'aqi':'yes',
          'alerts':'yes',
        }
    ).then((value) {
      debugPrint('Get Data Successful');
      weatherModel= WeatherModel.fromJson(value.data);
      debugPrint(weatherModel!.location!.country);
      emit(GetWeatherDataSuccessState());
    }).catchError((error){
      debugPrint('Error in get weather : ${error.toString()}');
    });
  }

}