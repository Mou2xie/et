import 'package:hive_flutter/hive_flutter.dart';
import '../models/settings.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<Settings>('settings');
  }

  static Box<Settings> getSettingsBox() {
    return Hive.box<Settings>('settings');
  }
}