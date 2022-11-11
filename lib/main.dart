
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /*
  *

{

  "weather": [
    {
      "main": "Rain",
      "description": "moderate rain",
      "icon": "10d"
    }
  ],
  "main": {
    "temp": 298.48,
    "feels_like": 298.74,
  },
  "name": "Zocca",
  "cod": 200
}

                        */

  var currentCity ;
  var temperature;
  var description;

  void getWeather() async
  {
    print("clicked");
    String cityName = cityNameController.text;
    final queryparameter = {
      "q": cityName,
      "appid": "476d7f2559919d457197305729d0b1aa"
    };
    Uri uri = new Uri.https("api.openweathermap.org","/data/2.5/weather",queryparameter);
    final jsonData = await get(uri);
    final json = jsonDecode(jsonData.body);

    setState(() {
      currentCity = json["name"];
      temperature = json["main"]["temp"];
      description = json["weather"][0]["main"];
    });
  }
  TextEditingController cityNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Weather App"),
          ),
          body:
          Center(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Currently in "+(currentCity == null? "Loading" : currentCity),
                  style: TextStyle(fontSize: 30),
                ),
                Text((temperature == null? "Loading": (temperature-273).toStringAsFixed(2)).toString()+"\u00B0",
                  style: TextStyle(fontSize: 50),
                ),
                Text((description == null ? "Loading" : description),
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: cityNameController,
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                    onPressed: getWeather,
                    child: Text("search")
                )
              ],
            )
        )
      ),
    );
  }
}

