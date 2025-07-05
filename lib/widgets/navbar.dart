import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryDark,
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Text(
            'Sniffra',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.lightText,
            ),
          ),
          
          // Nav Links
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _NavLink(title: 'Home', route: '/home'),
              _NavLink(title: 'Get Sniffra', route: '/get-sniffra'),
              _NavLink(title: 'Forum', route: '/forum'),
              _NavLink(title: 'About Us', route: '/about'),
              _NavLink(title: 'Whitepaper', route: '/whitepaper'),
            ],
          )
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String title;
  final String route;

  const _NavLink({required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextButton(
        onPressed: () => context.go(route),
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.lightText,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}