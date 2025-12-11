import 'dart:io';
import 'package:flutter/material.dart';

/// Image picker widget for selecting product images
class ImagePickerBox extends StatelessWidget {
  final File? selectedImage;
  final VoidCallback onTap;

  const ImagePickerBox({
    super.key,
    required this.selectedImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[300]!, style: BorderStyle.solid),
        ),
        child: selectedImage != null
            ? _buildSelectedImage()
            : _buildPlaceholder(),
      ),
    );
  }

  Widget _buildSelectedImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.file(selectedImage!, fit: BoxFit.cover),
    );
  }

  Widget _buildPlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.add_photo_alternate, size: 40, color: Colors.grey[500]),
        ),
        const SizedBox(height: 12),
        Text(
          'Tap to select image',
          style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
