import 'package:flutter/material.dart';
import 'package:seoul_event/screens/event_screens.dart';

void main() {
  runApp(const EventsApp());
}

class EventsApp extends StatelessWidget {
  const EventsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Events UI',
      home: EventsPage(),
    );
  }
}
