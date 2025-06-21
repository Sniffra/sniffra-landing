import 'package:flutter/material.dart';
import '../theme/colors.dart';

class GetSniffraPage extends StatelessWidget {
  const GetSniffraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Download Sniffra Here",
        style: TextStyle(fontSize: 32, color: AppColors.primaryDark),
      ),
    );
  }
}