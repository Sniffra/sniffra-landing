import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/pages/about_us_page.dart';
import 'package:myapp/pages/blog_page.dart';
import 'package:myapp/pages/get_sniffra_page.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/whitepaper_page.dart';
import 'package:myapp/theme/colors.dart';
import 'package:myapp/widgets/navbar.dart';

void main() {
  runApp(const MyApp());
}

// Private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

// Router configuration
final _router = GoRouter(
  initialLocation: '/home',
  navigatorKey: _rootNavigatorKey,
  routes: [
    // This ShellRoute builds the UI with the NavBar and a body.
    // The body will be any of the matching sub-routes.
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return Scaffold(
          body: Column(
            children: [
              const NavBar(),
              // The area for the page content
              Expanded(
                child: child,
              ),
            ],
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/get-sniffra',
          builder: (context, state) => const GetSniffraPage(),
        ),
        GoRoute(
          path: '/blog',
          builder: (context, state) => const BlogPage(),
        ),
        GoRoute(
          path: '/about',
          builder: (context, state) => const AboutUsPage(),
        ),
        GoRoute(
          path: '/whitepaper',
          builder: (context, state) => const WhitepaperPage(),
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sniffra',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.lightText,
        fontFamily: 'Roboto', // A good default web font
      ),
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}