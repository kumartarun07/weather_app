
import 'package:flutter/material.dart';

class WidgetHelper
{
  myIcon({Icon ? mIcon})
  {
    var mIcon;
    double? mSize=30;
    Color? mColor;
    return  Icon(mIcon,size: mSize,color: mColor,);
  }
}