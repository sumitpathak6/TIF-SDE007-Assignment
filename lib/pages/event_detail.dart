import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tif/models/Event.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventDetailPage extends StatefulWidget {
  // Define the event object to display event details
  final Event event;

  const EventDetailPage({super.key, required this.event});

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

bool isExpanded = false;

String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text; // No need to truncate if it's within the limit
    } else {
      return text.substring(0, maxLength - 3) + '...'; // Truncate and add "..."
    }
  }

class _EventDetailPageState extends State<EventDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Event Details',
          style: GoogleFonts.notoSansThai(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
        ),
        actions: [
          Container(
            height: 20,
            width: 50,
            margin: const EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.grey.withOpacity(0.7),
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.transparent, width: 2.0)),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark,
                  color: Colors.white,
                  size: 25.0,
                )),
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                child: Image.network(
                  widget.event.banner_image,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //color: Colors.white.withOpacity(0.8),
                  padding: const EdgeInsets.all(26.0),
                  child: Text(
                    widget.event.title,
                    style: GoogleFonts.notoSansThai(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: widget.event.organiser_icon.endsWith('.svg')
                            ? SvgPicture.network(
                                widget.event.organiser_icon,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.event.organiser_icon,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.event.organiser_name,
                            style: GoogleFonts.notoSansThai(
                                fontWeight: FontWeight.w600, fontSize: 16.0),
                          ),
                          Text(
                            'Organizer',
                            style: GoogleFonts.notoSansThai(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          shape: BoxShape.rectangle,
                          color: Colors.grey.withOpacity(0.35),
                        ),
                        child: const Icon(
                          Icons.calendar_month_sharp,
                          size: 35.0,
                          color: Color.fromARGB(255, 3, 99, 178),
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat('dd MMMM, yyyy')
                                .format(widget.event.date_time),
                            style: GoogleFonts.notoSansThai(
                                fontWeight: FontWeight.w600, fontSize: 16.0),
                          ),
                          Text(
                            DateFormat('EEEE, h:mm a')
                                .format(widget.event.date_time),
                            style: GoogleFonts.notoSansThai(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          shape: BoxShape.rectangle,
                          color: Colors.grey.withOpacity(0.35),
                        ),
                        child: const Icon(
                          Icons.location_pin,
                          size: 35.0,
                          color: Color.fromARGB(255, 3, 99, 178),
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            truncateText(widget.event.venue_name, 30),
                            style: GoogleFonts.notoSansThai(
                                fontWeight: FontWeight.w600, fontSize: 16.0),
                          ),
                          Text(
                            '${widget.event.venue_city},${widget.event.venue_country}',
                            style: GoogleFonts.notoSansThai(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'About Event',
                    style: GoogleFonts.notoSansThai(
                        fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    widget.event.description,
                    style: GoogleFonts.notoSansThai(
                        fontSize: 16, fontWeight: FontWeight.w500),
                    maxLines:
                        3, // Adjust the number of lines to your preference
                    overflow: TextOverflow
                        .ellipsis, // Display '...' when text overflows
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 250,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(
                    255, 51, 73, 239), // Change the color as needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 35,
                  ),
                  Text(
                    "BOOK NOW",
                    style: GoogleFonts.notoSansThai(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_circle_right_sharp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
