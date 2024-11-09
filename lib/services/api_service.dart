import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seoul_event/models/seoul_event_model.dart';

class ApiService {
  static const String baseUrl = "http://localhost:8080";
  static const String events = "seoul-events";

  static Future<List<SeoulEventModel>> getSeoulEvents() async {
    List<SeoulEventModel> eventInstances = [];
    final url = Uri.parse('$baseUrl/$events');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
        final events = jsonResponse['seoulEvents'];
        for (var event in events) {
          eventInstances.add(SeoulEventModel.fromJson(event));
        }
      } catch (e) {
        // print('Error parsing response: $e');
        throw Exception('Failed to parse event data');
      }
      return eventInstances;
    }
    throw Exception('Failed to load events: ${response.statusCode}');
  }
}
