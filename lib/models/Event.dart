// ignore_for_file: non_constant_identifier_names

class Event {
  final String banner_image;
  final String title;
  final DateTime date_time; // DateTime for event date and time
  final String eventTime;
  final String venue_name;
  final String venue_city;
  final String venue_country;
  final String description;
  final String organiser_name;
  final String organiser_icon;

  Event(
      {required this.banner_image,
      required this.title,
      required this.date_time,
      required this.eventTime,
      required this.venue_name,
      required this.venue_city,
      required this.venue_country,
      required this.description,
      required this.organiser_name,
      required this.organiser_icon});
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
      venue_country: 'CA',
      description: "Dummy description sjdjfuwfjwfghf",
      organiser_name: 'The Internet Folks',
      organiser_icon:
          'https://files.realpython.com/media/PyGame-Update_Watermarked.bb0aa2dfe80b.jpg'),
  Event(
      banner_image:
          'https://files.realpython.com/media/PyGame-Update_Watermarked.bb0aa2dfe80b.jpg',
      title: 'A Virtual Evening of Smooth  Jazz',
      date_time: DateTime(2023, 05, 01, 18, 0), // Example DateTime
      eventTime: '2:00 PM',
      venue_name: 'Lot 13',
      venue_city: 'Oakland 2',
      venue_country: 'CA',
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      organiser_name: 'The Internet Folks',
      organiser_icon:
          'https://files.realpython.com/media/PyGame-Update_Watermarked.bb0aa2dfe80b.jpg'),
  Event(
      banner_image:
          'https://files.realpython.com/media/PyGame-Update_Watermarked.bb0aa2dfe80b.jpg',
      title: "International Band Music Concert",
      date_time: DateTime(2021, 12, 14, 16, 00), // Example DateTime
      eventTime: '5:30 PM',
      venue_name: 'Gala ',
      venue_city: '36 Guild',
      venue_country: 'UK',
      description: "Dummy description",
      organiser_name: 'The Internet Folks',
      organiser_icon:
          'https://files.realpython.com/media/PyGame-Update_Watermarked.bb0aa2dfe80b.jpg'),
  Event(
      banner_image:
          'https://files.realpython.com/media/PyGame-Update_Watermarked.bb0aa2dfe80b.jpg',
      title: "Jo Malone London's Mother's Day Presents",
      date_time: DateTime(2023, 04, 28, 17, 30), // Example DateTime
      eventTime: '5:30 PM',
      venue_name: 'Radius Gallery',
      venue_city: 'Santa Cruz',
      venue_country: 'CA',
      description: "Dummy description",
      organiser_name: 'The Internet Folks',
      organiser_icon:
          'https://files.realpython.com/media/PyGame-Update_Watermarked.bb0aa2dfe80b.jpg'),
];
