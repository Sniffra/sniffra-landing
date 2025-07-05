import 'package:flutter/material.dart';
import '../theme/colors.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Forum Coming Soon!",
        style: TextStyle(fontSize: 32, color: AppColors.primaryDark),
      ),
    );
  }
}