import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BackendService {
  static Future<List<Map<String, String>>> getSuggestions(String query) async {
    if (query.isEmpty && query.length < 3) {
      return Future.value([]);
    }

    var url = Uri.https('nominatim.openstreetmap.org', '/search',
        {'q': query, 'format': 'json'});
    var response = await http.get(url);
    List<Suggestion> suggestions = [];

    if (response.statusCode == 200) {
      Iterable json = convert.jsonDecode(response.body);

      suggestions = List<Suggestion>.from(
        json.map(
          (e) => Suggestion.fromJson(e),
        ),
      );
    }

    return Future.value(
      suggestions
          .map(
            (e) => {
              'name': e.display_name,
              'lat': e.lat,
              'lon': e.lon,
              'type': e.type,
            },
          )
          .toList(),
    );
  }
}

class Suggestion {
  final String display_name;
  final String lat;
  final String lon;
  final String type;

  Suggestion(
      {required this.display_name,
      required this.lat,
      required this.lon,
      required this.type});

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
      display_name: json['display_name'],
      lat: json['lat'],
      lon: json['lon'],
      type: json['type'],
    );
  }
}
