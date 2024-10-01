import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/ui_helper/app_const_page.dart';
import 'package:weather_app/ui_helper/style_helper.dart';

class HomePage extends StatelessWidget 
{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu,size: 30,)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.wifi,size: 30,))
        ],
      ),
      body: Stack(fit: StackFit.expand,
        children:[
          Image.asset("assets/img/pexels-stijn.jpg",fit: BoxFit.fill,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("Alahan Panjang",style: myFont20(),),
                    //  Divider(color: Colors.black,thickness: 2,),
                      Text("Mon, 05:30",style: myFont12(),)
                    ],
                  ),
                  Icon(Icons.location_on_outlined,size: 30,)
                ],
              ),

              Container(width: 200,height: 150,
              child: Column(
                children: [
                  Text("Partly Sunny",style: myFont12(),),
                  Text("14'C",style: myFont50(),),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Feels like : 18",style: myFont12(),),
                      SizedBox(width: 5,),
                      Icon(Icons.arrow_upward,color: Colors.red,),
                      SizedBox(width: 5,),
                      Text("22'",style: myFont12(),),
                      SizedBox(width: 5,),
                      Icon(Icons.arrow_downward_sharp,color: Colors.blue,),
                      SizedBox(width: 5,),
                      Text("10",style: myFont12(),)
                    ],
                  )
                ],
              ),
              ),

              Container(
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
                              Text("${weather.data[index]["Time"]}",style: myFont20(),),
                              Icon(Icons.cloud,color: Colors.blue.shade200,size: 40,),
                              Icon(Icons.messenger,color: Colors.blue.shade200,size: 40,),
                              Text("${weather.data[index]["Percent"]}",style: myFont20(),),
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              )


            ],
                    ),
          ),
      ]),
    );
  }
}
