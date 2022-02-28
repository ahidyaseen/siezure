import 'package:flutter/material.dart';

import 'components/body.dart';

class HistoryPatientScreen extends StatefulWidget {
  static String routeName = "/history_patient";

  @override
  State<HistoryPatientScreen> createState() => _HistoryPatientScreenState();
}

class _HistoryPatientScreenState extends State<HistoryPatientScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History Patient"),
      ),
      body: Body(counter: _counter),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
