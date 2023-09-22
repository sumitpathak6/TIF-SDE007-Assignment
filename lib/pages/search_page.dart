import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tif/components/text.dart';
import 'package:tif/display/SearchEventCard.dart';
import 'package:tif/models/Event.dart';
import 'package:tif/models/EventListView.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  
  List<Event> filteredEvents = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredEvents = List.from(events);
  }

  void _updateFilteredEvents(String query) {
    if (query.isNotEmpty) {
      final searchQuery = query.toLowerCase();
      setState(() {
        filteredEvents = events.where((event) {
          final title = event.title.toLowerCase();
          return title.contains(searchQuery);
        }).toList();
      });
    } else {
      setState(() {
        filteredEvents = [];
      });
    }
  }

  Future<void> searchEvents(String query) async {
    final apiUrl =
        'https://sde-007.api.assignment.theinternetfolks.works/v1/event?search=$query';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data =
            json.decode(response.body)['content']['data'];
        final List<SearchEventsCard> events = data.map((eventData) {
          return SearchEventsCard(
            banner_image: eventData['banner_image'],
            title: eventData['title'],
            venue_name: eventData['venue_name'],
            venue_city: eventData['venue_city'],
            date_time: eventData['date_time'],
            venue_country: eventData['venue_country'],
          );
        }).toList();
        setState(() {
          filteredEvents = events.cast<Event>();
        });
      } else {
        throw Exception('Failed to load events');
      }
    } catch (error) {
      throw Exception('Failed to connect to the server');
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        elevation: 0,
        title: const text(txt: 'Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: _updateFilteredEvents,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type Event Name',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.blue,
                        size: 35.0,
                      ),
                      hintStyle: GoogleFonts.notoSansThai(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: EventListView(events: filteredEvents),
            )
          ],
        ),
      ),
    );
  }
}
