import 'package:hive/hive.dart';
import 'settings.dart';

class SettingsAdapter extends TypeAdapter<Settings> {
  @override
  final int typeId = 0; // 必须唯一

  @override
  Settings read(BinaryReader reader) {
    final map = reader.readMap();
    return Settings.fromMap(Map<String, dynamic>.from(map));
  }

  @override
  void write(BinaryWriter writer, Settings obj) {
    writer.writeMap(obj.toMap());
  }
}