import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/pages/about_us_page.dart';
import 'package:myapp/pages/forum_page.dart';
import 'package:myapp/pages/get_sniffra_page.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/whitepaper_page.dart';
import 'package:myapp/theme/colors.dart';
// CHANGE 1: You now need to import the MobileDrawer, which is in navbar.dart
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
        // --- THIS IS THE SECTION TO CHANGE ---
        return Scaffold(
          // CHANGE 2: Move the NavBar to the appBar property.
          // The appBar expects a PreferredSizeWidget, so we wrap our NavBar.
          // This is the standard way to create custom app bars.
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(100.0), // Adjust height as needed
            child: NavBar(),
          ),

          // CHANGE 3: Add the MobileDrawer to the endDrawer property.
          // This is what the hamburger icon's onPressed function looks for.
          endDrawer: const MobileDrawer(),

          // The body is now just the page content itself.
          body: child,
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
          path: '/forum',
          builder: (context, state) => const ForumPage(),
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