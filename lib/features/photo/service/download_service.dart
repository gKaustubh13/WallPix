// lib/services/download_service.dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';

class DownloadService {
  static Future<bool> downloadWallpaper(
    String imageUrl,
    String fileName,
  ) async {
    try {
      _showToast("Downloading wallpaper...");

      // Download image using http
      final response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode != 200) {
        _showToast("Failed to download image");
        return false;
      }

      // Save using Save As dialog
      final success = await _saveWithDialog(response.bodyBytes, fileName);

      if (success) {
        _showToast("Wallpaper saved successfully!");
        return true;
      } else {
        _showToast("Download cancelled");
        return false;
      }
    } catch (e) {
      _showToast("Download failed: ${e.toString()}");
      return false;
    }
  }

  /// Uses FlutterFileDialog to let user choose save location
  static Future<bool> _saveWithDialog(List<int> bytes, String fileName) async {
    try {
      final params = SaveFileDialogParams(
        data: Uint8List.fromList(bytes), 
        fileName: "$fileName.jpg",
      );

      final filePath = await FlutterFileDialog.saveFile(params: params);

      if (filePath != null) {
        print("File saved at: $filePath");
        return true;
      } else {
        print("User cancelled the save dialog");
        return false;
      }
    } catch (e) {
      print("Error saving file: $e");
      return false;
    }
  }

  static void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }
}
