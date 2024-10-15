import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/ui_helper/app_const_page.dart';
import 'package:weather_app/ui_helper/style_helper.dart';

class HomePage extends StatefulWidget
{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
   DateFormat mFormat =DateFormat.jms();
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(GetWeatherSearchEvent(query: "Jodhpur"));
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body:
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/img/pexels-stijn.jpg",),fit: BoxFit.fill,)),
            child:  BlocBuilder<WeatherBloc,WeatherState>(builder: (_,state){
              if(state is WeatherLoadingState)
              {
                return Center(child: CircularProgressIndicator(),);
              }else if (state is WeatherErrorState)
              {
                return Center(child: Text(state.ErrorMsg),);
              }else if(state is WeatherLoadedState)
              {
                var mData = state.weatherDataModel;
                return
                      Stack(
                        alignment: Alignment.bottomRight,
                        children:[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
                            child:Column(crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  IconButton(onPressed: (){}, icon: Icon(Icons.menu,size: 50,color: Colors.red,)),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.wifi,size: 30,)),
                                ],),
                                SizedBox(height: 10,),
                                Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("${(mData.city!.name)}",style: myFont20(),),
                                    SizedBox(width: 10,),
                                    Icon(Icons.location_on_outlined,size: 25,)
                                  ],
                                ),
                                  Text(mFormat.format(DateTime.fromMillisecondsSinceEpoch(mData.list![0].dt!.toInt())).toString(),style: myFont12(),),
                                  SizedBox(height: 100,),
                                  Container(width: MediaQuery.of(context).size.width,
                                    height: 150,
                                  child: Column(
                                    children: [
                                      Text("Partly Sunny",style: myFont20(),),
                                      Text("${mData.list![0].main!.temp} 'C",style: myFont50(),),
                                      Row(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Feels like : ${mData.list![0].main!.feels_like!.toString()}",style: myFont15(),),
                                          SizedBox(width: 5,),
                                          Icon(Icons.arrow_upward,color: Colors.red,),
                                          SizedBox(width: 5,),
                                          Text(mData.list![0].main!.temp_max.toString(),style: myFont15(),),
                                          SizedBox(width: 5,),
                                          Icon(Icons.arrow_downward_sharp,color: Colors.blue,),
                                          SizedBox(width: 5,),
                                          Text(mData.list![0].main!.temp_min.toString(),style: myFont15(),)
                                        ],
                                      )
                                    ],),),

                              ],)
                        ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              width: double.infinity,height: 300,
                              child: Column(
                                children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Hourly Forecast",style: TextStyle(fontSize: 20,color: Colors.white),),
                                      Text("72 Hours",style:  TextStyle(fontSize: 20,color: Colors.white,))
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    width: double.infinity,height: 250,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
                                    child: ListView.builder(
                                        itemCount: 50,scrollDirection: Axis.horizontal,
                                        itemBuilder: (_,index){
                                          return Container(margin: EdgeInsets.all(10),
                                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                              children: [
                                                Text(mFormat.format(DateTime.fromMillisecondsSinceEpoch(mData.list![0].dt!.toInt())),style: myFont20(),),
                                                Icon(Icons.cloud,color: Colors.blue.shade200,size: 40,),
                                                Container(height: 40,width: 50,
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.blue.shade200),
                                                  child: Center(child: Text(mData.list![0].main!.temp.toString(),style: myFont15(),),),
                                                ),
                                                Text("${weather.data[index]["Percent"]}",style: myFont20(),),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          )
                      ]);
              }
              return Container();
            }),
          )
    );
  }
}
