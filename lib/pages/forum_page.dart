import 'package:flutter/material.dart';
import '../theme/colors.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Our Latest Blog Posts",
        style: TextStyle(fontSize: 32, color: AppColors.primaryDark),
      ),
    );
  }
}