import 'package:flutter/material.dart';

class ImageRounded extends StatelessWidget {
  const ImageRounded({
    Key? key,
    this.urlImage,
    this.assetImage,
    required this.radiusTop,
    required this.radiusBottom,
  }) : super(key: key);

  final String? assetImage;
  final String? urlImage;
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
      child: urlImage != null
          ? Image.network(
              urlImage!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Tratamento de Erro na Imagem
                return Image.asset("assets/images/error_404.jpg");
              },
            )
          : assetImage != null
              ? Image.asset(
                  assetImage!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Tratamento de Erro na Imagem
                    return Image.asset("assets/images/error_404.jpg");
                  },
                )
              : Image.asset(
                  "assets/images/error_404.jpg",
                  fit: BoxFit.cover,
                ),
    );
  }
}
