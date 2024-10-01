
import 'package:flutter/material.dart';

class WidgetHelper
{
  myIconButton({Icon ? micon})
  {
    var micon;
    double? msize;
    return IconButton(onPressed: (){} ,icon: Icon(micon,size: msize,),);
  }
}