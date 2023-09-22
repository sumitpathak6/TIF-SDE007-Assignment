import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tif/components/text.dart';
import 'package:tif/models/Event.dart';
import 'package:tif/models/EventListView.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //List<Event> events = events; // Your list of events
  List<Event> filteredEvents = []; // Filtered events based on search

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredEvents = List.from(events);
  }

  void _updateFilteredEvents(String query) {
    // Filter events based on the event title (name)
    setState(() {
      if (query.isEmpty) {
        // If the search query is empty, show the complete list
        filteredEvents = List.from(events);
      } else {
        filteredEvents = events.where((event) {
          final title = event.title.toLowerCase();
          final searchQuery = query.toLowerCase();
          return title.contains(searchQuery);
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    // Dispose of the searchController when the widget is disposed
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Implement your search page UI here
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
                IconButton(
                  onPressed: () {
                    _updateFilteredEvents(searchController.text);
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.blue,
                    size: 35.0,
                  ),
                ),
                Container(
                  width: 1.0, // Adjust the width as needed
                  height: 24.0, // Adjust the height as needed
                  color: Colors.black, // Divider color
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0), // Adjust the margin as needed
                ),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type Event Name',
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
