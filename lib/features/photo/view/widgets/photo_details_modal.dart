// lib/features/photo/view/widgets/photo_details_modal.dart
import 'package:flutter/material.dart';
import 'package:wallpix/features/explore/model/photo_model.dart';
import 'photo_description_card.dart';
import 'photographer_info_card.dart';
import 'image_info_card.dart';

class PhotoDetailsModal extends StatelessWidget {
  const PhotoDetailsModal({super.key, required this.photo});

  final PhotoModel photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Title
          const Text(
            "Photo Details",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),

          // Photo description
          if (photo.alt.isNotEmpty) ...[
            PhotoDescriptionCard(description: photo.alt),
            const SizedBox(height: 20),
          ],

          // Photographer info
          PhotographerInfoCard(photographer: photo.photographer),
          const SizedBox(height: 20),

          // Image details
          ImageInfoCard(
            width: photo.width,
            height: photo.height,
            photoId: photo.id,
          ),
          const SizedBox(height: 32),

          // Close button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Close",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}
