import 'package:flutter/material.dart';
import 'package:sourcev1/weather/http_helper.dart';
import '../weather/weather.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  String weatherInfo = "";
  Weather weather = Weather("", 0, 0, 0, 0, "");
  HttpHelper httpHelper = HttpHelper();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    httpHelper.GetWeatherofGCU("31.573152", "74.3078585").then((weatherObj) {
      weather = weatherObj;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Info"),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                hintText: "Please Enter the name of city",
                suffixIcon:
                    IconButton(icon: Icon(Icons.search), onPressed: () {})),
          ),
          createAWeatherRow("City Name", weather.cityName),
          createAWeatherRow(
              "Temperature", weather.temperature.toStringAsFixed(3)),
          createAWeatherRow("Wind Speed", weather.windSpeed.toString()),
          createAWeatherRow("Cloud Cover", weather.cloudCover.toString()),
          createAWeatherRow("Humidity", weather.humidity.toString()),
          createAWeatherRow("Desciption", weather.description)
        ],
      ),
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

// class AboutUSScreen extends StatefulWidget {
//   const AboutUSScreen({super.key});

//   @override
//   State<AboutUSScreen> createState() => _AboutUSScreenState();
// }

// class _AboutUSScreenState extends State<AboutUSScreen> {
//   String message = "";
//   TextEditingController tecName = TextEditingController();
//   late int counter;

//   @override
//   void initState() {
//     counter = 0;
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("About us"),
//           backgroundColor: Colors.amberAccent,
//         ),
//         body: Column(
//           children: [
//             TextField(
//               controller: tecName,
//               decoration: InputDecoration(hintText: "Please enter your name"),
//             ),
//             Center(
//               child: ElevatedButton(
//                   onPressed: onButtonPress, child: Text("Click here!")),
//             ),
//             Text(message)
//           ],
//         ));
//   }

//   void onButtonPress() {
//     setState(() {
//       counter = counter + 1;
//       message = "Welcome " +
//           tecName.text +
//           " to our application for the " +
//           counter.toString() +
//           " times";
//     });
//   }
// }
