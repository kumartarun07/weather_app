import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/ui_helper/style_helper.dart';

class weather
{
  static final List<Map<String,dynamic>> data =
      [
        {"Time":"06:00  ","Percent":"2%","web":"Day"},
        {"Time":"07:00  ","Percent":"5%","web":"Night"},
        {"Time":"08:00  ","Percent":"10%"},
        {"Time":"09:00  ","Percent":"10%"},
        {"Time":"10:00  ","Percent":"10%"},
        {"Time":"11:00  ","Percent":"5%"},
        {"Time":"12:00  ","Percent":"15%"},
        {"Time":"01:00  ","Percent":"20%"},
        {"Time":"02:00  ","Percent":"3%"},
        {"Time":"03:00  ","Percent":"25%"},
        {"Time":"04:00  ","Percent":"2%"},
        {"Time":"05:00  ","Percent":"4%"},
        {"Time":"06:00  ","Percent":"11%"},
        {"Time":"07:00  ","Percent":"16%"},
        {"Time":"08:00  ","Percent":"25%"},
        {"Time":"09:00  ","Percent":"12%"},
        {"Time":"10:00  ","Percent":"11%"},
        {"Time":"11:00  ","Percent":"26%"},
        {"Time":"12:00  ","Percent":"10%"},
        {"Time":"01:00  ","Percent":"5%"},
        {"Time":"02:00  ","Percent":"2%"},
      ];
}

class AppConstPage extends StatefulWidget
{
  const AppConstPage({super.key});

  @override
  State<AppConstPage> createState() => _AppConstPageState();
}

class _AppConstPageState extends State<AppConstPage>
{
  @override
  void initState() {
    context.read<WeatherBloc>().add(GetWeatherSearchEvent(query: "Jodhpur"));
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: BlocBuilder<WeatherBloc,WeatherState>(builder: (_,state){
            if(state is WeatherLoadingState){
              return Center(child: CircularProgressIndicator(),);
            }else if(state is WeatherErrorState){
              return Center(child: Text(state.ErrorMsg),);
            }
            else if(state is WeatherLoadedState){
              var mData = state.weatherDataModel;
              return Column(
                children: [
                  Container(width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        itemCount: mData.list!.length,
                        itemBuilder: (_,index){
                          return Container(margin: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
                            child: ListTile(
                              title: Column(
                                children: [
                                  Container(width: 250,height: 150,
                                    child: Column(
                                      children: [
                                        Container(height: 30,width: 80,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.grey.shade200,),
                                          child: Center(child: Text("${weather.data[index]["web"]}",style: myFont12(),)),
                                        ),
                                        Row(mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.cloud_upload,color: Colors.blue.shade100,size: 50,),
                                            SizedBox(width: 10,),
                                            Text("${mData.list![0].main!.temp}",style: myFont50(),),
                                            SizedBox(width: 10,),
                                            Icon(Icons.arrow_upward,color: Colors.red,size: 50,),
                                          ],
                                        ),
                                        Text("Partly Sunny",style: myFont15(),),

                                      ],
                                    ),
                                  ),

                                  Container(width: double.infinity,height: 400,
                                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.thermostat_outlined,size: 30,),
                                                SizedBox(width: 5,),
                                                Text("Feels like")
                                              ],
                                            ),
                                            Text("${mData.list![0].main!.feels_like}",style: myFont15(),)

                                          ],
                                        ),
                                        Divider(thickness: 2,color: Colors.grey.shade300,),
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.wind_power,size: 30,),
                                                SizedBox(width: 5,),
                                                Text("Wind")
                                              ],
                                            ),
                                            Text("${mData.list![0].wind!.speed}mph ssw",style: myFont15(),)

                                          ],
                                        ),
                                        Divider(thickness: 2,color: Colors.grey.shade300,),
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.cloud,size: 30,),
                                                SizedBox(width: 5,),
                                                Text("Wind Gust")
                                              ],
                                            ),
                                            Text("${mData.list![0].wind!.gust} mph s",style: myFont15(),)

                                          ],
                                        ),
                                        Divider(thickness: 2,color: Colors.grey.shade300,),
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.sunny,size: 30,),
                                                SizedBox(width: 5,),
                                                Text("Uv Index")
                                              ],
                                            ),
                                            Text("5(Moderate)",style: myFont15(),)

                                          ],
                                        ),
                                        Divider(thickness: 2,color: Colors.grey.shade300,),
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.bubble_chart,size: 30,),
                                                SizedBox(width: 5,),
                                                Text("Preciptation")
                                              ],
                                            ),
                                            Text("40%",style: myFont15(),)

                                          ],
                                        ),
                                        Divider(thickness: 2,color: Colors.grey.shade300,),
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.cloud,size: 30,),
                                                SizedBox(width: 5,),
                                                Text("Cloud Cover")
                                              ],
                                            ),
                                            Text("${mData.list![0].clouds!.all}%",style: myFont15(),)

                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),

                            ),
                          );
                        }),
                  )
                ],);
            }
            return Container();
          })
  )
  ));
  }
}
