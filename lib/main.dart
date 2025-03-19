import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/settings.dart';
import 'models/settings_adapter.dart';
import 'pages/home.dart';

void main() async {
  await Hive.initFlutter();

  // register adapter
  Hive.registerAdapter(SettingsAdapter());

  // open box
  await Hive.openBox<Settings>('settings');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Settings>>(
      valueListenable: Hive.box<Settings>('settings').listenable(),
      builder: (context, box, widget) {
        final settings = box.get('settings', defaultValue: Settings());
        return MaterialApp(
          title: 'Expense Tracker',
          theme: (settings?.isDarkMode ?? false) ? ThemeData.dark() : ThemeData.light(),
          home: HomePage(),
        );
      },
    );
  }
}