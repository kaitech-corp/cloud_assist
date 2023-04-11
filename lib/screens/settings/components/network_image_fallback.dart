import 'package:flutter/material.dart';

class CircularImageWidget extends StatelessWidget {

  const CircularImageWidget({super.key, 
    required this.imageUrl,
    required this.assetImage,
    required this.radius,
  });
  final String imageUrl;
  final String assetImage;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: ClipOval(
        child: AspectRatio(
          aspectRatio: 1,
          child: Image(
            image: networkImageWithAssetFallback(
              imageUrl: imageUrl,
              assetImage: assetImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  ImageProvider networkImageWithAssetFallback(
      {required String imageUrl, required String assetImage}) {
    if (imageUrl != null && imageUrl.isNotEmpty) {
      return NetworkImage(
        imageUrl,
      );
    } else {
      return AssetImage(
        assetImage,
      );
    }
  }
}
