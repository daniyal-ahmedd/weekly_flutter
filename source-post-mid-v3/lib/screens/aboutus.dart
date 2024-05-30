import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lec1v1/weather/weather.dart';
import '../weather/http_helper.dart';

class AboutUSScreen extends StatefulWidget {
  const AboutUSScreen({super.key});

  @override
  State<AboutUSScreen> createState() => _AboutUSScreenState();
}

class _AboutUSScreenState extends State<AboutUSScreen> {
  Weather weatherObj = Weather("", 0, "", 0, 0, 0);
  HttpHelper httpHelper = HttpHelper();

  @override
  void initState() {
    // TODO: implement initState

    httpHelper.GetWeatherOfGCU().then((weatheData) {
      weatherObj = weatheData;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Info of GCU"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                hintText: "Enter the city name",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                )),
          ),
          createAWeatherRow(
              "Temperature", weatherObj.temperature.toStringAsFixed(2)),
          createAWeatherRow("Description", weatherObj.description),
          createAWeatherRow("City Name", weatherObj.cityName),
          createAWeatherRow(
              "Feels Like", weatherObj.feels_like.toStringAsFixed(2)),
          createAWeatherRow("Cloud Cover", weatherObj.cloudCover.toString()),
          createAWeatherRow(
              "Wind Speed", weatherObj.windSpeed.toStringAsFixed(2)),
          ElevatedButton(
              onPressed: () {
                double lat = 31.573152;
                double lon = 74.3078585;
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text("Map View"),
                      ),
                      body: GoogleMap(
                          markers: {
                            Marker(
                                markerId: MarkerId("1"),
                                position: LatLng(lat, lon),
                                infoWindow: InfoWindow(
                                    title: "GCU", snippet: "University"))
                          },
                          mapType: MapType.normal,
                          initialCameraPosition: CameraPosition(
                              target: LatLng(lat, lon), zoom: 15)),
                    );
                  },
                ));
              },
              child: const Text("View on Map"))
        ],
      ),
    );
  }

  Widget createAWeatherRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style:
                  TextStyle(fontSize: 23, color: Theme.of(context).hintColor),
            ),
            flex: 12,
          ),
          Expanded(
            child: Text(value,
                style: TextStyle(
                    fontSize: 23, color: Theme.of(context).primaryColor)),
            flex: 8,
          )
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
//   late String welcomeMessage;
//   TextEditingController controllerNameField = TextEditingController();
//   late int counter;
//   @override
//   void initState() {
//     welcomeMessage = "";
//     counter = 0;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("About us"),
//         backgroundColor: Colors.deepOrangeAccent,
//       ),
//       body: Column(
//         children: [
//           TextField(
//             controller: controllerNameField,
//             decoration: InputDecoration(hintText: "Please Enter your name"),
//           ),
//           Center(
//               child: ElevatedButton(
//                   onPressed: onButtonPressed, child: Text("Click me!"))),
//           Text(welcomeMessage)
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }

//   void onButtonPressed() {
//     var name = controllerNameField.text;
//     counter = counter + 1;
//     setState(() {
//       welcomeMessage = "Welcome $name A2 and A3 for the $counter time(s)";
//     });
//   }
// }
