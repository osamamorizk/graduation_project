import 'package:flutter/material.dart';

class ThemeSelctionItem extends StatelessWidget {
  const ThemeSelctionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.selected,
  });

  final IconData icon;
  final String title;
  final void Function()? onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: selected,
      onTap: onTap,
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
