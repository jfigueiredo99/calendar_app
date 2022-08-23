import 'package:calendar/constants/consts.dart';
import 'package:calendar/widgets/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final ItemScrollController _scrollController = ItemScrollController();
  final DateTime today = DateTime.now();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) => _scrollController.scrollTo(
        index: today.month - 1,
        duration: const Duration(seconds: 1),
      ),
    );
    // _scrollController.scrollTo(
    //   index: 8,
    //   duration: const Duration(seconds: 1),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(39, 55, 103, 1),
        ),
        child: Container(
          padding: const EdgeInsets.only(top: 64),
          child: ScrollablePositionedList.builder(
              itemScrollController: _scrollController,
              itemCount: months.length,
              itemBuilder: (context, index) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: MonthCalendarWidget(month: months[index]));
              }
              // [
              //   const MonthCalendarWidget(),
              // ],
              ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
