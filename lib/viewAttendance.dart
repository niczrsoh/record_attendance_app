import 'package:flutter/material.dart';
import 'package:record_attendance_app/editAttendance.dart';
import 'package:table_calendar/table_calendar.dart';

class ViewAttendence extends StatefulWidget {
  ViewAttendence({Key? key, required this.marked, this.presence = true})
      : super(key: key);
  bool marked;
  bool presence;
  @override
  _ViewAttendenceState createState() => _ViewAttendenceState();
}

class _ViewAttendenceState extends State<ViewAttendence> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now().subtract(const Duration(days: 1));
  DateTime focusedDay = DateTime.now();
  String notYetMark =
      "We're sorry.\nThe attendence for today was not yet marked by teacher";
  String present = "Present for today";
  String absent = "Absent for today";
  @override
  Widget build(BuildContext context) {
    List dayName = [
      '',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('View Attendence'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditAttendence()));
                },
                icon: const Icon(Icons.edit))
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text('ALICE LIM',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const Divider(thickness: 0),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(children: [
                      Text(dayName[focusedDay.weekday]),
                      Text(focusedDay.toString().substring(0, 10))
                    ]),
                    const VerticalDivider(
                      thickness: 3,
                      color: Colors.black,
                    ),
                    Container(
                      width: 200,
                      color: (widget.marked)
                          ? (widget.presence)
                              ? Colors.green.shade100
                              : Colors.red.shade100
                          : Colors.white,
                      child: Text((widget.marked)
                          ? (widget.presence)
                              ? present
                              : absent
                          : notYetMark),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 3, color: Colors.black),
              TableCalendar(
                focusedDay: focusedDay,
                firstDay: DateTime(2021),
                lastDay: DateTime(2050),
                calendarFormat: format,
                onFormatChanged: (_format) {
                  setState(() {
                    format = _format;
                  });
                },
                startingDayOfWeek: StartingDayOfWeek.sunday,
                daysOfWeekVisible: true,
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDay, day);
                },
                onDaySelected: (_selectedDay, _focusedDay) {
                  setState(() {
                    focusedDay = _focusedDay;
                    selectedDay = _selectedDay;
                  });
                  print(selectedDay);
                },
                calendarStyle: CalendarStyle(
                    isTodayHighlighted: true,
                    selectedTextStyle: const TextStyle(color: Colors.black),
                    todayDecoration: BoxDecoration(
                      color: (widget.marked)
                          ? (widget.presence)
                              ? Colors.green
                              : Colors.red
                          : Colors.blue,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.blue),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    defaultDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    weekendDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                headerStyle: HeaderStyle(
                    formatButtonShowsNext: false,
                    formatButtonDecoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5.0)),
                    formatButtonTextStyle:
                        const TextStyle(color: Colors.white)),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            color: Colors.green, height: 10.0, width: 10.0),
                        const Text(' present')
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(color: Colors.red, height: 10.0, width: 10.0),
                        const Text(' absent')
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            color: Colors.blue, height: 10.0, width: 10.0),
                        const Text(' not yet mark')
                      ],
                    ),
                  ]))
            ],
          ),
        ));
  }
}
