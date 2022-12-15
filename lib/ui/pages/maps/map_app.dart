import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:food_box/ui/widgets/bigtext.widget.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

class MapApp extends StatefulWidget {
  const MapApp({Key? key}) : super(key: key);

  @override
  State<MapApp> createState() => _MapAppState();
}

class _MapAppState extends State<MapApp> {
  LatLng point = LatLng(-18.909222756152914,47.53689228412027);
  var location = [];
  late List<Placemark> placemarks;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                    height: size.height * 0.5,
                    child: FlutterMap(
                      options: MapOptions(
                        onTap: (tapPosition, p) async{
                          placemarks = await placemarkFromCoordinates(p.latitude, p.longitude);
                          setState((){
                            point = p;
                            print("$placemarks ${placemarks.first.name}");
                          });
                        },
                        center: LatLng(-18.909222756152914,47.53689228412027),
                        zoom: 12.0,
                      ),
                      layers: [
                        TileLayerOptions(
                            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: ['a', 'b', 'c']
                          // userAgentPackageName: 'com.example.app', options: null,
                        ),
                        MarkerLayerOptions(markers: [
                          Marker(
                              width: 120,
                              height: 120,
                              point: point,
                              builder: (ctx) => const Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ))
                        ])
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 34.0, horizontal: 16.0),
                    child: Column(
                      children: const [
                        Card(
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.location_on_outlined, color: Colors.black,),
                              hintText: "search for location",
                              contentPadding: EdgeInsets.all(15.0)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Positioned(
                    top: size.height * 0.5,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Column(children: [
                        SizedBox(height: 7,),

                        BigText(text: "Delivery Address"),
                        SizedBox(height: 10,),
                        //input address 1
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'location address',
                                    prefixIcon: Icon(Icons.location_on_outlined, color: Theme.of(context).primaryColor,)
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 10,),
                        //input address 2
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Postal Address',
                                    prefixIcon: Icon(Icons.email, color: Theme.of(context).primaryColor,)
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 10,),
                        //input address 2
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'city',
                                    prefixIcon: Icon(Icons.location_city, color: Theme.of(context).primaryColor,)
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 10,),
                        //input name
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Name',
                                    prefixIcon: Icon(Icons.person, color: Theme.of(context).primaryColor,)
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10,),
                        //input phone
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Phone',
                                    prefixIcon: Icon(Icons.phone, color: Theme.of(context).primaryColor,)
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],),
                    ),
                  )


                ]
              ),
            ),
          ));
  }
}

class AttributionWidget {}
