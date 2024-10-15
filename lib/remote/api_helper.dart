import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as httpWeather;
import 'package:weather_app/model/api_exception.dart';
class ApiHelper
{
  Future<dynamic> getApI({required String url})
  async{
    var uri = Uri.parse(url);
     try{
          var res = await httpWeather.get(uri);
          return returnJsonRes(res);
     }on SocketException catch(e){
       throw FetchException(errorMsg: "No Internet !!");

     }
  }

  dynamic  returnJsonRes(httpWeather.Response response)
  {
    switch(response.statusCode)
        {
      case 200:{ var mData = jsonDecode(response.body);
         return mData;}
      case 400:
        throw BadRequestException(errorMsg: response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(errorMsg: response.body.toString());
      case 500:
      default:throw FetchException(errorMsg: "Error Occurred while Communication with server with StatusCode :"
        "${response.statusCode}");
    }
  }
}