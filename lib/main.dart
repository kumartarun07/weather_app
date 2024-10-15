import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/remote/api_helper.dart';
import 'package:weather_app/ui_pages/detail_page.dart';
import 'package:weather_app/ui_pages/home_page.dart';

void main()
{
  runApp(
    BlocProvider(create: (context)=>WeatherBloc(apiHelper: ApiHelper()),child: MyApp(),)
  );
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }

}