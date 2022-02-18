import 'package:flutter/material.dart';

class ImageRounded extends StatelessWidget {
  const ImageRounded({
    Key? key,
    required this.urlImage,
    required this.radiusTop,
    required this.radiusBottom,
  }) : super(key: key);

  final String urlImage;
  final double radiusTop;
  final double radiusBottom;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radiusTop),
        topRight: Radius.circular(radiusTop),
        bottomLeft: Radius.circular(radiusBottom),
        bottomRight: Radius.circular(radiusBottom),
      ),
      child: Image.network(
        urlImage,
        height: 250,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}