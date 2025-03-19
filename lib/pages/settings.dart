import 'package:flutter/material.dart';
import '../models/settings.dart';
import '../services/hive_service.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingsBox = HiveService.getSettingsBox();
    final settings = settingsBox.get('settings', defaultValue: Settings());

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Dark Mode'),
              value: settings?.isDarkMode ?? false,
              onChanged: (value) {
                if (settings != null) {
                  settings.isDarkMode = value;
                  settings.save();
                }
              },
            ),
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: settings?.isNotificationEnabled ?? false,
              onChanged: (value) {
                if (settings != null) {
                  settings.isNotificationEnabled = value;
                  settings.save();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}