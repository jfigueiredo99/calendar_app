import 'package:flutter/material.dart';

import 'widgets/calendar_page_widget.dart';

void main() {
  runApp(const MyCalendar());
}

class MyCalendar extends StatelessWidget {
  const MyCalendar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalendarPage(title: 'Calendar'),
    );
  }
}
