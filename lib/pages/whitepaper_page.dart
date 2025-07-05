// lib/pages/whitepaper_page.dart

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart'; // The only import we need!
import '../theme/colors.dart';

class WhitepaperPage extends StatelessWidget {
  const WhitepaperPage({super.key});

  @override
  Widget build(BuildContext context) {
    // The path to your PDF asset.
    const String pdfAssetPath = 'assets/documents/sniffra_whitepaper.pdf';

    return Container(
      // The page's background color.
      color: AppColors.primaryDark.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 48.0),
        child: Column(
          children: [
            // 1. Page Title
            const Text(
              "Sniffra Whitepaper",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDark,
              ),
            ),
            const SizedBox(height: 24),

            // 2. The PDF Viewer Widget - This is the magic.
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    )
                  ],
                ),
                // This single widget does everything!
                child: SfPdfViewer.asset(
                  pdfAssetPath,
                  // Optional: You can customize the scroll direction if you want
                  // pageLayoutMode: PdfPageLayoutMode.single, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}