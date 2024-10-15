/// create SysModel
class SysModel
{
  String? pod;
  SysModel({ this.pod});
  factory SysModel.fromJson(Map<String,dynamic>json)=>
      SysModel(
        pod: json['pod'],);
}

/// create WindModel
class WindModel
{
  int? deg;
  num? gust;
  num? speed;
  WindModel({this.deg,this.gust,this.speed});
  factory WindModel.fromJson(Map<String,dynamic>json)=>WindModel(
    deg: json["deg"],
    speed: json["speed"],
    gust: json["gust"],
  );
}

/// create CloudModel
class CloudsModel
{
  int? all;
  CloudsModel({this.all});
  factory CloudsModel.fromJson(Map<String,dynamic>json)=>CloudsModel(
      all: json['all']
  );
}

/// create WeatherModel
class WeatherModel
{
  String? description;
  String? icon;
  int? id;
  String? main;

  WeatherModel({this.description,this.id,this.icon,this.main,});
  factory WeatherModel.fromJson(Map<String,dynamic>json)=>WeatherModel(
    id: json['id'],
    description: json['description'],
    icon: json['icon'],
    main: json['main'],
  );
}

/// create MainModel
class MainModel
{
  num? feels_like;
  num? grnd_level;
  num? humidity;
  num? pressure;
  num? sea_level;
  num? temp;
  num? temp_kf;
  num? temp_max;
  num? temp_min;

  MainModel({this.feels_like,this.grnd_level,this.humidity,this.pressure,
    this.sea_level,this.temp,this.temp_max,this.temp_min,this.temp_kf});

  factory MainModel.fromJson(Map<String,dynamic>json)=>MainModel(
    feels_like: json['feels_like'],
    grnd_level: json['grnd_level'],
    humidity: json['humidity'],
    sea_level: json['sea_level'],
    pressure: json['pressure'],
    temp: json['temp'],
    temp_max: json['temp_max'],
    temp_min: json['temp_min'],
    temp_kf: json['temp_kf'],
  );
}

/// create ListModel
class ListModel
{
  CloudsModel?clouds;
  num? dt;
  String? dt_txt;
  MainModel?main;
  num?pop;
  SysModel?sys;
  num?visibility;
  List<WeatherModel>?weather;
  WindModel?wind;

  ListModel({this.clouds, this.dt, this.dt_txt, this.main, this.pop, this.sys,
    this.visibility, this.weather, this.wind});

  factory ListModel.fromJson(Map<String,dynamic>json)
  {
    List<WeatherModel>mData =[];
    for(Map<String,dynamic> eachData in json['weather'])
      {
        mData.add(WeatherModel.fromJson(eachData));
      }
    return ListModel(
        clouds: CloudsModel.fromJson(json['clouds']),
        dt: json['dt'],
        dt_txt: json['dt_txt'],
        main: MainModel.fromJson(json['main']),
        pop: json['pop'],
        sys: SysModel.fromJson(json['sys']),
        visibility: json['visibility'],
        weather:mData,
        wind: WindModel.fromJson(json['wind']));
  }
}

/// create CoorModel
class CoordModel
{
  num? lat;
  num? lon;
  CoordModel({this.lat,this.lon});
  factory CoordModel.fromJson(Map<String,dynamic>json)=>CoordModel(
    lat: json['lat'],
    lon: json['lon'],
  );
}

/// create CityModel
class CityModel
{
  CoordModel? coord;
  String? country;
  num? id;
  String? name;
  num? population;
  num? sunrise;
  num? sunset;
  num? timezone;

  CityModel({this.timezone,this.coord,this.name,this.id,
    this.sunset,this.sunrise,this.country,this.population});
  factory CityModel.fromJson(Map<String,dynamic>json)=>
      CityModel(
        id: json['id'],
        population: json['population'],
        sunrise: json['sunrise'],
        sunset: json['sunset'],
        timezone: json['timezone'],
        name: json['name'],
        country: json['country'],
        coord: CoordModel.fromJson(json['coord']),
      );
}

/// create WeatherModel
class WeatherDataModel
{
  CityModel? city;
  num? cnt;
  String? cod;
  List<ListModel>? list;
  num? message;

  WeatherDataModel({this.city, this.cnt, this.cod, this.list, this.message});
  factory WeatherDataModel.fromJson(Map<String,dynamic>json)
  {
    List<ListModel>wData = [];
    for(Map<String,dynamic> eachData in json['list'])
      {
        wData.add(ListModel.fromJson(eachData));
      }
    return WeatherDataModel(
      city: CityModel.fromJson(json['city']),
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: wData,
    );
  }
}