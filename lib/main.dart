import 'package:flutter/material.dart';
import 'package:weather_app/ui_pages/detail_page.dart';
import 'package:weather_app/ui_pages/home_page.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailPage(),
    );
  }

}