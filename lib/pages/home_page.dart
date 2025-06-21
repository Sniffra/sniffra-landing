import 'package:flutter/material.dart';
import '../theme/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Welcome to Sniffra - Home Page',
        style: TextStyle(fontSize: 32, color: AppColors.primaryDark),
      ),
    );
  }
}