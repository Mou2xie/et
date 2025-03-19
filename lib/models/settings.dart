import 'package:hive/hive.dart';

class Settings extends HiveObject {
  bool isDarkMode;
  bool isNotificationEnabled;

  Settings({
    this.isDarkMode = false,
    this.isNotificationEnabled = true,
  });

  // 手动实现序列化
  Map<String, dynamic> toMap() {
    return {
      'isDarkMode': isDarkMode,
      'isNotificationEnabled': isNotificationEnabled,
    };
  }

  // 手动实现反序列化
  factory Settings.fromMap(Map<String, dynamic> map) {
    return Settings(
      isDarkMode: map['isDarkMode'] ?? false,
      isNotificationEnabled: map['isNotificationEnabled'] ?? true,
    );
  }
}