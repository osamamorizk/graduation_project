import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome Back',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontSize: 24)),
        const SizedBox(height: 16),
        Text(
            'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontWeight: FontWeight.normal)),
      ],
    );
  }
}
