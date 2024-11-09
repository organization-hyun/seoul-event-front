import 'package:flutter/material.dart';
import 'package:seoul_event/screens/event_list_screen.dart';

void main() {
  runApp(const EventsApp());
}

class EventsApp extends StatelessWidget {
  const EventsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Events UI',
      home: EventListScreen(),
    );
  }
}
