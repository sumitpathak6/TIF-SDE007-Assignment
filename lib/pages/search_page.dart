import 'package:flutter/material.dart';
import 'package:tif/components/text.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    // Implement your search page UI here
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: text(txt: 'Search'),
      ),
      body: const Column(
        children: [
          // Add a search bar widget here
          // Add a ListView for displaying search results here
        ],
      ),
    );
  }
}
