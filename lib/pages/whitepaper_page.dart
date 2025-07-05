// lib/pages/whitepaper_page.dart

import 'package:flutter/material.dart';
import 'dart:ui_web';
import 'dart:html';
import '../theme/colors.dart';

class WhitepaperPage extends StatefulWidget {
  const WhitepaperPage({super.key});

  @override
  State<WhitepaperPage> createState() => _WhitepaperPageState();
}

class _WhitepaperPageState extends State<WhitepaperPage> {
  final IFrameElement _iFrameElement = IFrameElement();

  @override
  void initState() {
    super.initState();

    final pdfUrl = 'assets/documents/sniffra_whitepaper.pdf';

    _iFrameElement
      ..style.border = 'none'
      ..style.width = '100%'
      ..style.height = '100%'
      ..src = pdfUrl;

    platformViewRegistry.registerViewFactory(
      'iframe-pdf-viewer',
      (int viewId) => _iFrameElement,
    );
  }

  @override
  Widget build(BuildContext context) {
    // FIX: Removed the Scaffold. The root widget is now a Container.
    return Container(
      // We moved the background color here from the old Scaffold.
      color: AppColors.primaryLight,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Sniffra Whitepaper",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDark,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "The official document outlining the vision, technology, and roadmap for the Sniffra project.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.primaryDark.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const HtmlElementView(
                  viewType: 'iframe-pdf-viewer',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}