// lib/features/photo/view/widgets/download_fab.dart
import 'package:flutter/material.dart';

class DownloadFAB extends StatelessWidget {
  const DownloadFAB({
    super.key,
    required this.isDownloading,
    required this.onPressed,
  });

  final bool isDownloading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: FloatingActionButton.extended(
        onPressed: isDownloading ? null : onPressed,
        backgroundColor: isDownloading ? Colors.grey : Colors.blue,
        foregroundColor: Colors.white,
        icon: isDownloading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : const Icon(Icons.download),
        label: Text(isDownloading ? "Downloading..." : "Download"),
      ),
    );
  }
}
