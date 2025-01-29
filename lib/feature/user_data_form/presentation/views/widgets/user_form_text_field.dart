import 'package:flutter/material.dart';

class UserFormTextField extends StatelessWidget {
  const UserFormTextField({
    super.key,
    required this.controller,
    required this.enabled,
  });

  final bool enabled;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          hintText: enabled ? 'Required Field' : null),
      controller: controller,
      enabled: enabled,
    );
  }
}
