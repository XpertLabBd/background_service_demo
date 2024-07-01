import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

import 'background_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure the binding is initialized
  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true, // Change to false in production
  );
  Workmanager().registerPeriodicTask(
    "1",
    simplePeriodicTask,
    frequency: Duration(minutes: 5), // The minimum interval is 15 minutes
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Background Task Example'),
        ),
        body: Center(
          child: Text('Background Task Running...'),
        ),
      ),
    );
  }
}
