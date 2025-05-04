import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<dynamic> askPermissionDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Permission Required'),
      content: const Text(
        'To receive reminders, please enable notification permissions from settings.',
        style: TextStyle(fontSize: 16),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(fontSize: 15),
          ),
        ),
        TextButton(
          onPressed: () {
            openAppSettings();
            Navigator.pop(context);
          },
          child: const Text(
            'Open Settings',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    ),
  );
}
