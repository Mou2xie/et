import 'package:hive/hive.dart';

class Settings extends HiveObject {
  bool isDarkMode;
  bool isNotificationEnabled;

  Settings({
    this.isDarkMode = false,
    this.isNotificationEnabled = true,
  });

  Map<String, dynamic> toMap() {
    return {
      'isDarkMode': isDarkMode,
      'isNotificationEnabled': isNotificationEnabled,
    };
  }

  factory Settings.fromMap(Map<String, dynamic> map) {
    return Settings(
      isDarkMode: map['isDarkMode'] ?? false,
      isNotificationEnabled: map['isNotificationEnabled'] ?? true,
    );
  }
}