
import 'package:flutter/material.dart';
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
  int a = 5;
  TextEditingController cityNameController = new TextEditingController();
  void getWeather()
  {
    print("clicked");
    String cityName = cityNameController.text;
    print(cityName);
  }

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
              Text("Currently in ",
                style: TextStyle(fontSize: 30),
              ),
              Text("25\u00B0",
                style: TextStyle(fontSize: 50),
              ),
              Text("Rainy",
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

