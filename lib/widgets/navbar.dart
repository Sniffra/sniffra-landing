import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/colors.dart';

// The main NavBar widget. It uses a LayoutBuilder to decide which version to show.
class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // We'll use a common breakpoint for web. 800 is a good starting point.
        if (constraints.maxWidth > 800) {
          return const _DesktopNavBar();
        } else {
          return const _MobileNavBar();
        }
      },
    );
  }
}

// The desktop version with the "file tab" look. (Largely your existing code)
class _DesktopNavBar extends StatelessWidget {
  const _DesktopNavBar();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: AppColors.primaryDark,
          padding: const EdgeInsets.only(top: 16, left: 48, right: 48),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Logo
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: InkWell(
                  onTap: () => context.go('/home'),
                  child: Image.asset(
                    'images/logo_crop.png',
                    height: 40,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text('Sniffra',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColors.lightText));
                    },
                  ),
                ),
              ),
              const SizedBox(width: 48),

              // Nav Links
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _NavLink(title: 'Home', route: '/home'),
                    _NavLink(title: 'Get Sniffra', route: '/get-sniffra'),
                    _NavLink(title: 'About Us', route: '/about'),
                    _NavLink(title: 'Whitepaper', route: '/whitepaper'),
                  ],
                ),
              ),

              // Login Icon
              _LoginButton(
                onPressed: () => print('Login button pressed!'),
              ),
            ],
          ),
        ),
        const Divider(height: 1, thickness: 1, color: AppColors.primaryBlue),
      ],
    );
  }
}

// The mobile version with the hamburger menu icon.
class _MobileNavBar extends StatelessWidget {
  const _MobileNavBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryDark,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          InkWell(
            onTap: () => context.go('/home'),
            child: Image.asset('images/logo_crop.png', height: 35),
          ),
          // Hamburger Menu Icon
          IconButton(
            icon: const Icon(Icons.menu, color: AppColors.lightText, size: 30),
            onPressed: () {
              // This opens the drawer that we will define in the next step.
              Scaffold.of(context).openEndDrawer();
            },
            tooltip: 'Menu',
          ),
        ],
      ),
    );
  }
}

// This is the slide-out drawer for mobile. It can be a separate widget.
class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryDark,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Drawer Header with Logo
          DrawerHeader(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.primaryBlue)),
            ),
            child: Center(
              child: Image.asset('images/logo_crop.png', height: 50),
            ),
          ),
          // Navigation Links
          _DrawerLink(
            title: 'Home',
            icon: Icons.home_outlined,
            onTap: () => context.go('/home'),
          ),
          _DrawerLink(
            title: 'Get Sniffra',
            icon: Icons.download_outlined,
            onTap: () => context.go('/get-sniffra'),
          ),
          _DrawerLink(
            title: 'About Us',
            icon: Icons.info_outline,
            onTap: () => context.go('/about'),
          ),
          _DrawerLink(
            title: 'Whitepaper',
            icon: Icons.description_outlined,
            onTap: () => context.go('/whitepaper'),
          ),
          const Divider(color: AppColors.primaryBlue),
          // Login Link
          _DrawerLink(
            title: 'Login / Profile',
            icon: Icons.person_outline,
            onTap: () => print('Login pressed from drawer'),
          ),
        ],
      ),
    );
  }
}

// Helper widget for a link inside the mobile drawer
class _DrawerLink extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _DrawerLink({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.lightText),
      title: Text(title, style: const TextStyle(color: AppColors.lightText, fontSize: 18)),
      onTap: () {
        // Close the drawer first
        Navigator.of(context).pop();
        // Then perform the navigation/action
        onTap();
      },
    );
  }
}

// --- The helper widgets from before ---

class _NavLink extends StatelessWidget {
  final String title;
  final String route;

  const _NavLink({required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    // FIX IS ON THIS LINE: Changed .location to .matchedLocation
    final String currentLocation = GoRouterState.of(context).matchedLocation;
    final bool isActive = currentLocation == route;
    
    // Using a known light color for the page background
    const pageBackgroundColor = Color(0xFFFCFCFC); 

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () => context.go(route),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: isActive ? pageBackgroundColor : AppColors.primaryDark,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            border: Border(
              bottom: BorderSide(
                color: isActive ? pageBackgroundColor : AppColors.primaryBlue,
                width: 1,
              ),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? AppColors.primaryDark : AppColors.lightText,
              fontSize: 16,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
class _LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _LoginButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.person_outline),
        iconSize: 28,
        color: AppColors.lightText,
        tooltip: 'Login / Profile',
        splashRadius: 24,
      ),
    );
  }
}