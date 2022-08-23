import 'package:flutter/material.dart';

import '../constants/consts.dart';

class MonthCalendarWidget extends StatefulWidget {
  final String month;
  const MonthCalendarWidget({Key? key, required this.month}) : super(key: key);

  @override
  State<MonthCalendarWidget> createState() => _MonthCalendarWidgetState();
}

class _MonthCalendarWidgetState extends State<MonthCalendarWidget> {
  final DateTime _today = DateTime.now();
  late List<int> _daysOfTheCurrentMonth;

  @override
  void initState() {
    super.initState();
    _daysOfTheCurrentMonth = getDaysOfTheMonth(_today.month);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.month,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 40,
              child: _getDaysOfTheWeekHeaderWidget(),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Expanded(
              child: generateCalendarDays(_today),
            ),
          ],
        ),
      ),
    );
  }

  static List<int> getDaysOfTheMonth(int month) {
    DateTime now = DateTime.now();
    int _lastDayOfMonth = DateTime(now.year, month + 1, 0).day;
    List<int> daysOfTheMonth = [];
    for (var day = 0; day < _lastDayOfMonth; day++) {
      daysOfTheMonth.add(day + 1);
    }
    return daysOfTheMonth;
  }

  generateCalendarDays(DateTime today) {
    return GridView.count(
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      crossAxisCount: 7,
      children: _daysOfTheCurrentMonth
          .map((day) => Stack(
                children: [
                  Visibility(
                    visible: day == today.day &&
                        widget.month == months[today.month - 1],
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(99, 122, 255, 1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      day.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ))
          .toList(),
    );
  }

  _getDaysOfTheWeekHeaderWidget() {
    return GridView.count(
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      crossAxisCount: 7,
      children: daysOfTheWeek
          .map((day) => Center(
                child: Text(
                  day.substring(0, 1),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
