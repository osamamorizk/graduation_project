import 'package:flutter/material.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFCEAE8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        spacing: 8,
        children: [
          Icon(
            Icons.description_outlined,
            color: Colors.red,
            size: 30,
          ),
          Expanded(
            child: Text(
              "Eat more whole, unprocessed foods, reduce added sugars and feel better",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
