import 'package:flutter/material.dart';
import '../theme/colors.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "About the Sniffra Team",
        style: TextStyle(fontSize: 32, color: AppColors.primaryDark),
      ),
    );
  }
}