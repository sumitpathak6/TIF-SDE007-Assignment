import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/Event.dart';

Future<List<Event>> fetchEvents() async {
  final response = await http.get(Uri.parse(
      'https://sde-007.api.assignment.theinternetfolks.works/v1/event'));
  print(response.statusCode);

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> eventsData = data['content']['data'];

    List<Event> events = eventsData
        .map((event) => Event(
              banner_image: event['banner_image'],
              title: event['title'],
              date_time: DateTime.parse(event['date_time']),
              //eventTime: event['event_time'],
              venue_name: event['venue_name'],
              venue_city: event['venue_city'],
              venue_country: event['venue_country'],
              description: event['description'],
              organiser_name: event['organiser_name'],
              organiser_icon: event['organiser_icon'],
            ))
        .toList();
    return events;
  } else {
    throw Exception('Failed to load events');
  }
}
