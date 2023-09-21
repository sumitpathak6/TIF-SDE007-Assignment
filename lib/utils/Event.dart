// ignore_for_file: non_constant_identifier_names

class Event {
  final String banner_image;
  final String title;
  final DateTime date_time; // DateTime for event date and time
  final String eventTime;
  final String venue_name;
  final String venue_city;
  final String venue_country;

  Event(
      {required this.banner_image,
      required this.title,
      required this.date_time,
      required this.eventTime,
      required this.venue_name,
      required this.venue_city,
      required this.venue_country});
}

// Create a list of events
List<Event> events = [
  Event(
      banner_image:
          'https://files.realpython.com/media/PyGame-Update_Watermarked.bb0aa2dfe80b.jpg',
      title: "Jo Malone London's Mother's Day Presents",
      date_time: DateTime(2023, 04, 28, 17, 30), // Example DateTime
      eventTime: '5:30 PM',
      venue_name: 'Radius Gallery',
      venue_city: 'Santa Cruz',
      venue_country: 'CA'),
  Event(
      banner_image:
          'https://files.realpython.com/media/PyGame-Update_Watermarked.bb0aa2dfe80b.jpg',
      title: 'A Virtual Evening of Smooth  Jazz',
      date_time: DateTime(2023, 05, 01, 18, 0), // Example DateTime
      eventTime: '2:00 PM',
      venue_name: 'Lot 13',
      venue_city: 'Oakland 2',
      venue_country: 'CA'),
];
