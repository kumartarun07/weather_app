import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/model/api_exception.dart';
import 'package:weather_app/remote/api_helper.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/remote/urls.dart';

class WeatherBloc extends Bloc<WeatherEvent,WeatherState>
{
  ApiHelper apiHelper;
  WeatherBloc({required this.apiHelper}):super(WeatherInitialState()){
    on<GetWeatherSearchEvent>((event,emit)async{
      emit(WeatherLoadingState());
      try{
        var res = await apiHelper.getApI(url:Urls.getSearchUrl(event.query));
        if(res!=null){
          var mData = WeatherDataModel.fromJson(res);
          emit(WeatherLoadedState(weatherDataModel: mData));
        }else{
          emit(WeatherErrorState(ErrorMsg: "Uhh...No!!, Error Occurred"));
        }
      }on ApiException catch(e){
        emit(WeatherErrorState(ErrorMsg: e.toError()));
      }
      catch(e){
        emit(WeatherErrorState(ErrorMsg: e.toString()));
      }
    });
  }
}