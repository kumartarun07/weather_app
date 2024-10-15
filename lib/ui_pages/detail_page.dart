import 'package:flutter/material.dart';
import 'package:weather_app/ui_helper/app_const_page.dart';
import 'package:weather_app/ui_helper/style_helper.dart';

class DetailPage extends StatelessWidget
{
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context)
  {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Daily Detail",style: myFont15(),),
          centerTitle: true,
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new)),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.wifi,size: 30,))
          ],
          bottom: TabBar(
            labelColor: Colors.white,
              labelPadding: EdgeInsets.all(10),
              tabs: [
            Tab(child: Column(children: [Text("Mon",),Text("9\\06")],),),
            Tab(child: Column(children: [Text("Mon",),Text("9\\07")],),),
            Tab(child: Column(children: [Text("Mon",),Text("9\\08")],),),
            Tab(child: Column(children: [Text("Mon",),Text("9\\09")],),),
            Tab(child: Column(children: [Text("Mon",),Text("9\\10")],),),
            Tab(child: Column(children: [Text("Mon",),Text("9\\11")],),),
            Tab(child: Column(children: [Text("Mon",),Text("9\\12")],),),

          ],
                 indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),shape: BoxShape.rectangle,color: Color(0xff516AAB),
            )
          ),
        ),

        body: TabBarView(
            children: [
              AppConstPage(),
              AppConstPage(),
              AppConstPage(),
              AppConstPage(),
              AppConstPage(),
              AppConstPage(),
              AppConstPage(),
        ])
      ),
    );
  }
}
