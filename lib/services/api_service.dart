import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seoul_event/models/seoul_event_model.dart';

class ApiService {
  static const String baseUrl = "http://localhost:8080";
  static const String events = "seoul-events";

  static Future<List<SeoulEventModel>> getSeoulEventList(int page, int size) async {
    List<SeoulEventModel> eventInstances = [];
    final url = Uri.parse('$baseUrl/$events?page=$page&size=$size');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        final events = (data['content'] as List)
            .map((e) => SeoulEventModel.fromJson(e))
            .toList();
        eventInstances.addAll(events);
      } catch (e) {
        throw Exception('Failed to parse event data');
      }
      return eventInstances;
    }
    throw Exception('Failed to load events: ${response.statusCode}');
  }
}
