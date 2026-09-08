import 'package:flutter/material.dart';
import 'package:vinit_enterprise/utils/download_helper.dart';

class BrochureViewerDialog extends StatefulWidget {
  final String title;
  final String brochurePath;
  final List<String>? allBrochures;

  const BrochureViewerDialog({
    super.key,
    required this.title,
    required this.brochurePath,
    this.allBrochures,
  });

  static void show(
    BuildContext context, {
    required String title,
    required String brochurePath,
    List<String>? allBrochures,
  }) {
    showDialog(
      context: context,
      builder: (context) => BrochureViewerDialog(
        title: title,
        brochurePath: brochurePath,
        allBrochures: allBrochures,
      ),
    );
  }

  @override
  State<BrochureViewerDialog> createState() => _BrochureViewerDialogState();
}

class _BrochureViewerDialogState extends State<BrochureViewerDialog> {
  late PageController _pageController;
  int _currentIndex = 0;
  late List<String> _brochureList;

  @override
  void initState() {
    super.initState();
    if (widget.allBrochures != null && widget.allBrochures!.isNotEmpty) {
      _brochureList = widget.allBrochures!;
      final initialIdx = _brochureList.indexOf(widget.brochurePath);
      _currentIndex = initialIdx != -1 ? initialIdx : 0;
    } else {
      _brochureList = [widget.brochurePath];
      _currentIndex = 0;
    }
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _downloadOrOpenBrochure(String path) async {
    String pdfPath = path;
    if (path.endsWith('.jpg') || path.endsWith('.jpeg') || path.endsWith('.png')) {
      pdfPath = path.replaceAll(RegExp(r'\.(jpg|jpeg|png)$'), '.pdf');
    }
    await downloadOrOpenAsset(pdfPath);
  }

  Future<void> _downloadFullCatalogPdf() async {
    await downloadOrOpenAsset('assets/brochures/vinit_enterprise_complete_catalog.pdf');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 768;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        width: isDesktop ? 880 : double.infinity,
        constraints: const BoxConstraints(maxHeight: 850),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF0F172A) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                border: Border(
                  bottom: BorderSide(
                    color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0072CE).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.picture_as_pdf_rounded,
                      color: Color(0xFF0072CE),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : const Color(0xFF0A2540),
                          ),
                        ),
                        if (_brochureList.length > 1)
                          Text(
                            'Page ${_currentIndex + 1} of ${_brochureList.length} Brochure Sheets',
                            style: const TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => _downloadOrOpenBrochure(_brochureList[_currentIndex]),
                    icon: const Icon(Icons.picture_as_pdf_rounded, size: 16, color: Colors.white),
                    label: Text(
                      isDesktop ? 'Download Page PDF' : 'Page PDF',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0072CE),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    onPressed: _downloadFullCatalogPdf,
                    icon: const Icon(Icons.file_download_rounded, size: 16, color: Colors.white),
                    label: Text(
                      isDesktop ? 'Download Full Catalog (PDF)' : 'Full Catalog PDF',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF059669),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),

            // Image Carousel / Single Viewer
            Expanded(
              child: Container(
                color: isDark ? const Color(0xFF020617) : const Color(0xFFF1F5F9),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: _brochureList.length,
                      onPageChanged: (idx) {
                        setState(() {
                          _currentIndex = idx;
                        });
                      },
                      itemBuilder: (context, index) {
                        final currentPath = _brochureList[index];
                        return InteractiveViewer(
                          panEnabled: true,
                          minScale: 0.8,
                          maxScale: 3.5,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              currentPath,
                              fit: BoxFit.contain,
                              errorBuilder: (ctx, e, st) => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.picture_as_pdf_outlined, size: 64, color: Colors.grey),
                                  SizedBox(height: 12),
                                  Text(
                                    'Brochure Sheet Available Upon Request',
                                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    // Left/Right Navigation Arrows if multiple pages
                    if (_brochureList.length > 1) ...[
                      Positioned(
                        left: 12,
                        child: IconButton(
                          icon: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
                          ),
                          onPressed: _currentIndex > 0
                              ? () => _pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  )
                              : null,
                        ),
                      ),
                      Positioned(
                        right: 12,
                        child: IconButton(
                          icon: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 18),
                          ),
                          onPressed: _currentIndex < _brochureList.length - 1
                              ? () => _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  )
                              : null,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            // Bottom Carousel Indicators & Quick Download Hint
            if (_brochureList.length > 1)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC),
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_brochureList.length, (idx) {
                    final isSelected = _currentIndex == idx;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: isSelected ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFF0072CE) : Colors.grey.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
