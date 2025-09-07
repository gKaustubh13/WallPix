// lib/features/photo/view/widgets/photo_app_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhotoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PhotoAppBar({
    super.key,
    required this.onBackPressed,
    required this.onInfoPressed,
  });

  final VoidCallback onBackPressed;
  final VoidCallback onInfoPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: onBackPressed,
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: onInfoPressed,
          ),
        ),
      ],
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
