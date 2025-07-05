// lib/pages/whitepaper_page.dart

import 'dart:html'; // Important for using IFrameElement
import 'dart:ui' as ui; // Important for platform view registration
import 'package:flutter/material.dart';
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

    // The path to your PDF file in the 'assets' bundle.
    // Flutter Web serves assets from a path that starts with 'assets/'.
    final pdfUrl = 'assets/documents/SniffraWhitepaper.pdf';

    // Set up the IFrame properties
    _iFrameElement
      ..style.border = 'none' // Remove the default border
      ..style.width = '100%'
      ..style.height = '100%'
      ..src = pdfUrl;

    // This is the magic that registers the IFrameElement as a view
    // that Flutter can render. We give it a unique name.
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframe-pdf-viewer', // A unique ID for the view
      (int viewId) => _iFrameElement,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLight, // A light background for the page
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 1. Page Title
            const Text(
              "Sniffra Whitepaper",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDark,
              ),
            ),
            const SizedBox(height: 16),

            // 2. Sub-text or download link (optional but good practice)
            Text(
              "The official document outlining the vision, technology, and roadmap for the Sniffra project.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.primaryDark.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 24),

            // 3. The PDF Viewer
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
                // This widget displays the IFrame we registered in initState.
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