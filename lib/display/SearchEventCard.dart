// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SearchEventsCard extends StatelessWidget {
  final String banner_image;
  final String title;
  final DateTime date_time;
  final String venue_name;
  final String venue_city;
  final String venue_country;
  //final String eventTimings;

  const SearchEventsCard({
    super.key,
    required this.banner_image,
    required this.title,
    required this.date_time,
    required this.venue_name,
    required this.venue_city,
    required this.venue_country,
  });

  String formatEventDate(DateTime date) {
    final DateFormat formatter =
        DateFormat('\'${_ordinal(date.day)}\' MMM - E');
    return formatter.format(date).toUpperCase();
  }

  String _ordinal(int day) {
    if (day >= 11 && day <= 13) {
      return '${day}TH';
    }
    switch (day % 10) {
      case 1:
        return '${day}ST';
      case 2:
        return '${day}ND';
      case 3:
        return '${day}RD';
      default:
        return '${day}TH';
    }
  }

  String extractTime(DateTime date) {
    DateTime dateTime = DateTime.parse(date.toString());
    DateFormat timeFormat =
        DateFormat.jm(); // Format for time only (e.g., 9:00 AM)
    return timeFormat.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        //border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 5, // Blur radius
            offset: const Offset(0, 2), // Offset to bottom-right
          ),
        ],
        border: Border.all(
          color: Colors.grey.withOpacity(0.04),
          width: 1.0,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 70,
                height: 100,
                child: Image.network(
                  banner_image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 8.0,
              ),
              Text(
                '${formatEventDate(date_time)} - ${extractTime(date_time)}', // Format: "Date • Time"
                style: const TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 17, 141, 242),
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 8.0),
              Text(
                title,
                style: GoogleFonts.notoSansThai(
                    fontWeight: FontWeight.w500, fontSize: 18),
              ),
              const SizedBox(height: 8.0),
            ],
          ))
        ],
      ),
    );
  }
}
