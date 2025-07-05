import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/colors.dart';

class GetSniffraPage extends StatelessWidget {
  const GetSniffraPage({super.key});

  // Helper function to launch URLs
  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: ConstrainedBox(
            // Constrain the width for better readability on large screens
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 1. Main Headline
                const Text(
                  "Get Sniffra Today",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                  ),
                ),
                const SizedBox(height: 16),

                // 2. Sub-headline / Tagline
                Text(
                  "Join the community and help build a more transparent web. Available for all major browsers.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.primaryDark.withOpacity(0.8),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 48),

                // 3. Download Cards
                // Using a Wrap so it becomes a single column on narrow screens
                Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: [
                    DownloadCard(
                      browserName: 'Chrome',
                      storeName: 'Chrome Web Store',
                      browserIcon: FontAwesomeIcons.chrome,
                      iconColor: const Color(0xFF4285F4), // Google's blue
                      // TODO: Replace with your actual Chrome Store link
                      onPressed: () => _launchURL('https://chrome.google.com/webstore'),
                    ),
                    DownloadCard(
                      browserName: 'Firefox',
                      storeName: 'Firefox Browser ADD-ONS',
                      browserIcon: FontAwesomeIcons.firefoxBrowser,
                      iconColor: const Color(0xFFFF7139), // Firefox's orange
                      // TODO: Replace with your actual Firefox Add-ons link
                      onPressed: () => _launchURL('https://addons.mozilla.org/'),
                    ),
                    DownloadCard(
                      browserName: 'Edge',
                      storeName: 'Microsoft Edge Add-ons',
                      browserIcon: FontAwesomeIcons.edge,
                      iconColor: const Color(0xFF0078D7), // Edge's blue
                      // TODO: Replace with your actual Edge Add-ons link
                      onPressed: () => _launchURL('https://microsoftedge.microsoft.com/addons'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// A reusable card widget for displaying a browser download link.
class DownloadCard extends StatelessWidget {
  final String browserName;
  final String storeName;
  final IconData browserIcon;
  final Color iconColor;
  final VoidCallback onPressed;

  const DownloadCard({
    super.key,
    required this.browserName,
    required this.storeName,
    required this.browserIcon,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          FaIcon(browserIcon, size: 48, color: iconColor),
          const SizedBox(height: 16),
          Text(
            browserName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            storeName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.primaryDark.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: onPressed,
            icon: const Icon(Icons.download_rounded, size: 20),
            label: const Text(
              'Add to Browser',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}