import 'package:flutter/material.dart';
import '../weather/http_helper.dart';
import '../weather/weather.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  String weatherInfo = "";
  Weather weather = Weather("", 0, 0, 0, 0, "");
  httpHelper http_Helper = httpHelper();
  @override
  void initState(){
    super.initState();

    http_Helper.GetWeather("31.573152", "74.3078585").then((weatherObj){
      weather = weatherObj;
      setState(() {});
    }
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Weather info"),
        backgroundColor: Colors.greenAccent,      
        ),
      body: Column(children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Enter the name of the city",
            suffixIcon:
                    IconButton(icon: Icon(Icons.search), onPressed: () {})),
            ),
          createAWeatherRow("City Name", weather.city),
          createAWeatherRow(
              "Temperature", weather.temp.toStringAsFixed(3)),
          createAWeatherRow("Wind Speed", weather.wind_speed.toString()),
          createAWeatherRow("Cloud Cover", weather.cloudStatus.toString()),
          createAWeatherRow("Humidity", weather.humidity.toString()),
          createAWeatherRow("Desciption", weather.description)
      ]),
    );
  }

  Widget createAWeatherRow(String key, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Text(key,
                  style: TextStyle(
                      fontSize: 22, color: Theme.of(context).hintColor))),
          Expanded(
              flex: 7,
              child: Text(value,
                  style: TextStyle(
                      fontSize: 22, color: Theme.of(context).primaryColor))),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import '../common/menudrawer.dart';
// import '../common/ownNavBar.dart';
// class About extends StatefulWidget {
//   const About({super.key});

//   @override
//   State<About> createState() => _AboutState();
// }

// class _AboutState extends State<About> {
//   String message = "";
//   TextEditingController cont_name = TextEditingController();
//   late int counter;

//   @override
//   void initState(){
//     counter = 0;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("About us"), backgroundColor: Colors.greenAccent,
//       ),
//       body: Column(
//         children: [
//           TextField(
//             controller: cont_name,
//             decoration: InputDecoration(hintText: "Please enter your name"),
//           ),
//           Center(
//             child: ElevatedButton(
//                   onPressed: onButtonPress, child: Text("Click here!") ,
//             ),
//           ),
//           Text(message)
//         ],
//       )
//     );
//   }

//   void onButtonPress() {
//     setState(() {
//       counter = counter + 1;
//       message = "Welcome " +
//           cont_name.text + 
//           ", to our application for the " + 
//           counter.toString() + 
//           " times";
//     });
//   }
// }