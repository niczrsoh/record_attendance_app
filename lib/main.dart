import 'package:flutter/material.dart';
import 'package:record_attendance_app/viewAttendance.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Attendance app testing',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ViewAttendence(marked: false));
  }
}
