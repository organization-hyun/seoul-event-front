import 'package:flutter/material.dart';
import 'package:seoul_event/widgets/event_card.dart';
import 'package:seoul_event/widgets/search_bar.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

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
              // Event section "For You"
              const Text('For You',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              const EventCard(
                title: 'Exhibitions in San Francisco',
                subtitle: 'You might like these',
                imageUrl:
                    'https://yeyak.seoul.go.kr/web/common/file/FileDown.do?file_id=1708587459850DATOW92X2UBMKCTKJU85WVIEL',
              ),
              const SizedBox(height: 16),
              const EventCard(
                title: 'Live music in SF',
                subtitle: 'Today · 8 events',
                imageUrl:
                    'https://yeyak.seoul.go.kr/web/common/file/FileDown.do?file_id=17261001711188BN8YGBEHEGLSF0LPVC6AKPDE',
              ),
              const SizedBox(height: 16),
              const EventCard(
                title: 'Bay Area weekend markets',
                subtitle: 'Tomorrow · 2 events',
                imageUrl:
                    'https://yeyak.seoul.go.kr/web/common/file/FileDown.do?file_id=1728693015139BXTFE6DZGE2YT6I4DSD589I9C',
              ),
              const SizedBox(height: 16),
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
