import 'package:flutter/material.dart';
import 'package:seoul_event/models/seoul_event_model.dart';
import 'package:seoul_event/services/api_service.dart';
import 'package:seoul_event/widgets/event_card.dart';
import 'package:seoul_event/widgets/search_bar.dart';

class EventListScreen extends StatelessWidget {
  EventListScreen({super.key});

  final Future<List<SeoulEventModel>> events = ApiService.getSeoulEvents();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              const CustomSearchBar(
                hintText: "검색",
              ),
              const SizedBox(height: 16),
              // Category buttons
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _categoryButton('Art'),
                    _categoryButton('Music'),
                    _categoryButton('Food & Drink'),
                    _categoryButton('Markets'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text('For You',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              FutureBuilder(
                future: events,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics:
                          const NeverScrollableScrollPhysics(), // 부모 스크롤에만 반응하도록 설정 가능
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final event = snapshot.data![index];
                        return Column(
                          children: [
                            EventCard(
                              title: event.title,
                              region: event.region,
                              location: event.location,
                              imageUrl: event.imageUrl,
                            ),
                            const SizedBox(
                              height: 16,
                            )
                          ],
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.location_on),
                label: const Text('Nearby Events'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryButton(String category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200],
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(category),
      ),
    );
  }
}
