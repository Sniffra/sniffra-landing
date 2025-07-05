import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:SNIFFRA/pages/about_us_page.dart';
import 'package:SNIFFRA/pages/forum_page.dart';
import 'package:SNIFFRA/pages/get_sniffra_page.dart';
import 'package:SNIFFRA/pages/home_page.dart';
import 'package:SNIFFRA/pages/whitepaper_page.dart';
import 'package:SNIFFRA/theme/colors.dart';
import 'package:SNIFFRA/widgets/navbar.dart'; 

void main() {
  runApp(const SNIFFRA());
}

// Private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

// Router configuration
final _router = GoRouter(
  initialLocation: '/home',
  navigatorKey: _rootNavigatorKey,
  routes: [

    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {

        return Scaffold(

          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(100.0), // Adjust height as needed
            child: NavBar(),
          ),

          endDrawer: const MobileDrawer(),

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

class SNIFFRA extends StatelessWidget {
  const SNIFFRA({super.key});

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