import 'package:a2v1/weather/http_helper.dart';
import 'package:a2v1/weather/weather.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  HTTPHelper httpHelper = HTTPHelper();
  String weatherInfo = "";
  Weather weatherData = Weather(0, 0, 0, "", 0, "");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    httpHelper.GetWeatherOfGCU().then((weatherObj) {
      weatherData = weatherObj;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Info of GCU"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(children: [
        TextField(
          decoration: InputDecoration(
              hintText: "Please Enter the City Name",
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )),
        ),
        createAWeatherRow(
            "Temperature", weatherData.temperature.toStringAsFixed(3)),
        createAWeatherRow("Description", weatherData.description),
        createAWeatherRow("City Name", weatherData.cityName),
        createAWeatherRow("Cloud Cover", weatherData.cloudCover.toString()),
        createAWeatherRow(
            "Wind Speed", weatherData.windSpeed.toStringAsFixed(3)),
        createAWeatherRow("Humidity", weatherData.humidity.toString()),
        ElevatedButton(
            onPressed: () async {
              Location locationObj = Location();
              bool gpsStatus = await locationObj.serviceEnabled();

              if (gpsStatus == false) {
                gpsStatus = await locationObj.requestService();
              }
              if (gpsStatus == false) {
                return;
              }
              PermissionStatus permissionStatus =
                  await locationObj.hasPermission();

              if (permissionStatus != PermissionStatus.granted) {
                permissionStatus = await locationObj.requestPermission();
              }
              if (permissionStatus != PermissionStatus.granted) {
                return;
              }

              var location = await locationObj.getLocation();

              double lat = location.latitude ?? 31.573152;
              double lng = location.longitude ?? 74.3078585;
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return Scaffold(
                    appBar: AppBar(title: Text("GCU Map View")),
                    body: GoogleMap(
                        mapType: MapType.normal,
                        markers: {
                          Marker(
                              markerId: MarkerId("1"),
                              position: LatLng(lat, lng),
                              infoWindow:
                                  InfoWindow(title: "GCU", snippet: "Uni"))
                        },
                        initialCameraPosition:
                            CameraPosition(target: LatLng(lat, lng), zoom: 15)),
                  );
                },
              ));
            },
            child: const Text("View on Map"))
      ]),
    );
  }

  Widget createAWeatherRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Text(
                label,
                style:
                    TextStyle(fontSize: 25, color: Theme.of(context).hintColor),
              )),
          Expanded(
              flex: 6,
              child: Text(value,
                  style: TextStyle(
                      fontSize: 25, color: Theme.of(context).primaryColor))),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class AboutScreen extends StatefulWidget {
//   const AboutScreen({super.key});

//   @override
//   State<AboutScreen> createState() => _AboutScreenState();
// }

// class _AboutScreenState extends State<AboutScreen> {
//   String welcomeMessage = "";
//   late int counter;
//   TextEditingController controllerNameField = TextEditingController();

//   @override
//   void initState() {
//     // TODO: implement initState

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
//             decoration: InputDecoration(hintText: "Please Enter your name!"),
//           ),
//           Center(
//               child: ElevatedButton(
//                   onPressed: onButtonPress, child: Text("Click me!"))),
//           Text(welcomeMessage)
//         ],
//       ),
//     );
//   }

//   void onButtonPress() {
//     counter = counter + 1;
//     var name = controllerNameField.text;
//     setState(() {
//       welcomeMessage =
//           "Welcome $name to the online class of A2 and A3 for the $counter time(s)";
//     });
//   }
// }
