import 'package:flutter/material.dart';
import '../theme/colors.dart';

class WhitepaperPage extends StatelessWidget {
  const WhitepaperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Read the Sniffra Whitepaper",
        style: TextStyle(fontSize: 32, color: AppColors.primaryDark),
      ),
    );
  }
}