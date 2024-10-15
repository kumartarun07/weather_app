import 'package:weather_app/model/weather_model.dart';

abstract class WeatherState{}
class WeatherInitialState extends WeatherState{}
class WeatherLoadingState extends WeatherState{}
class WeatherLoadedState extends WeatherState{
  WeatherDataModel weatherDataModel;
  WeatherLoadedState({required this.weatherDataModel});
}
class WeatherErrorState extends WeatherState{
  String ErrorMsg;
  WeatherErrorState({required this.ErrorMsg});
}