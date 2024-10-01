import 'package:flutter/material.dart';
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

class AppConstPage extends StatelessWidget
{
  const AppConstPage({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Container(width: double.infinity,
              height: 700,

              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (_,index){
                    return Container(margin: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
                      child: ListTile(
                        title: Column(
                          children: [
                            Container(width: 200,height: 150,
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
                                      Text("22'C",style: myFont50(),),
                                      SizedBox(width: 10,),
                                      Icon(Icons.arrow_upward,color: Colors.red,),
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
                                      Text("22'C",style: myFont15(),)

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
                                      Text("7.1 mph ssw",style: myFont15(),)

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
                                      Text("20.9 mph s",style: myFont15(),)

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
                                      Text("85%",style: myFont15(),)

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
          ],
        ),
      ),
    );
  }
}
