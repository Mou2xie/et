import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/settings.dart';
import 'models/settings_adapter.dart'; // 导入适配器
import 'pages/home.dart';

void main() async {
  await Hive.initFlutter();

  // 手动注册适配器
  Hive.registerAdapter(SettingsAdapter());

  // 打开 Hive Box
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