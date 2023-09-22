import 'package:flutter/material.dart';
import 'package:tif/element/EventDetailCard.dart';
import 'package:tif/backend/fetchEvent.dart';
import 'package:tif/components/text.dart';
import 'package:tif/pages/event_detail.dart';
import 'package:tif/pages/search_page.dart';
import 'package:tif/models/Event.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const text(txt: '  Events'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
            icon: const Icon(
              Icons.search_outlined,
              color: Colors.black,
              size: 30,
            ),
          ),
          PopupMenuButton(
            iconSize: 30,
            color: Colors.black,
            itemBuilder: (BuildContext context) {
              return [];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: FutureBuilder<List<Event>>(
          future: fetchEvents(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Event> events = snapshot.data ?? [];
              return ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  Event event = events[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EventDetailPage(event: event),
                        ),
                      );
                    },
                    child: EventDetailCard(
                      banner_image: event.banner_image,
                      title: event.title,
                      //eventTimings: event.eventTime,
                      venue_name: event.venue_name,
                      venue_city: event.venue_city,
                      date_time: event.date_time,
                      venue_country: event.venue_country,
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
