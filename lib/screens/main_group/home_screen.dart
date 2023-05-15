import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';
import 'data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: mapController,
          options: MapOptions(
            center: LatLng(42.7751, 59.6123),
            zoom: 18,
            minZoom: 10,
            maxZoom: 18,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Scrollable(
                viewportBuilder: (context, position) {
                  return TypeAheadField(
                    textFieldConfiguration: const TextFieldConfiguration(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    suggestionsCallback: (pattern) async {
                      return await BackendService.getSuggestions(pattern);
                    },
                    itemBuilder: (context, itemData) {
                      return ListTile(
                        leading: const Icon(Icons.location_city),
                        title: Text(itemData['name']!),
                        subtitle: Text(
                          itemData['type']!.toUpperCase(),
                        ),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      double lat = double.parse(suggestion['lat']!);
                      double lon = double.parse(suggestion['lon']!);
                      mapController.move(LatLng(lat, lon), 18);
                    },
                    hideSuggestionsOnKeyboardHide: false,
                    loadingBuilder: (context) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Searching...'),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
