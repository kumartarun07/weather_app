abstract class WeatherEvent{}
class GetWeatherSearchEvent extends WeatherEvent{
  String query;
  GetWeatherSearchEvent({this.query="Jodhpur"});
}