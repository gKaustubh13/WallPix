// lib/features/photo/view/photo_screen.dart
import 'package:flutter/material.dart';
import 'package:wallpix/features/explore/model/photo_model.dart';
import 'package:wallpix/features/photo/service/download_service.dart';
import 'widgets/photo_app_bar.dart';
import 'widgets/photo_viewer.dart';
import 'widgets/photo_details_modal.dart';
import 'widgets/download_fab.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key, required this.photo});

  final PhotoModel photo;

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  bool _isDownloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: PhotoAppBar(
        onInfoPressed: () => _showPhotoDetails(context),
        onBackPressed: () => Navigator.pop(context),
      ),
      floatingActionButton: DownloadFAB(
        isDownloading: _isDownloading,
        onPressed: _downloadWallpaper,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: PhotoViewer(photo: widget.photo),
    );
  }

  Future<void> _downloadWallpaper() async {
    setState(() {
      _isDownloading = true;
    });

    final fileName =
        'wallpix_${widget.photo.id}_${DateTime.now().millisecondsSinceEpoch}';
    await DownloadService.downloadWallpaper(widget.photo.src.large2x, fileName);

    if (mounted) {
      setState(() {
        _isDownloading = false;
      });
    }
  }

  void _showPhotoDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => PhotoDetailsModal(photo: widget.photo),
    );
  }
}
