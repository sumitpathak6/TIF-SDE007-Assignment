import 'package:flutter/material.dart';
import 'package:tif/EventDetailCard.dart';
import 'package:tif/SearchEvents.dart';
import 'package:tif/pages/event_detail.dart';
import 'package:tif/models/Event.dart';

class EventListView extends StatelessWidget {
  final List<Event> events;

  const EventListView({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EventDetailPage(event: event),
              ),
            );
          },
          child: SearchEventsCard(
            banner_image: event.banner_image,
            title: event.title,
            eventTimings: event.eventTime,
            venue_name: event.venue_name,
            venue_city: event.venue_city,
            date_time: event.date_time,
            venue_country: event.venue_country,
          ),
        );
      },
    );
  }
}
