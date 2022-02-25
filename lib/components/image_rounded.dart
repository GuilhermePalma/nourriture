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
      // Verifica qual o Tipo de Imagem (Asset ou URL)
      child: urlImage != null
          ? Image.network(
              urlImage!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Tratamento de Erro na Imagem
                return Image.asset("assets/images/error_404.jpg");
              },
              // Adiciona o CircularProgress enquanto carrega a Imagem Online
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress != null) {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                } else {
                  return child;
                }
              },
            )
          : assetImage != null
              ? FutureBuilder(
                  // Cria um Evento Futuro que leva 3 segundos para carregar a Image Asset
                  future: Future.delayed(const Duration(seconds: 3)),
                  builder: (cntx, asyncSnapshot) {
                    return asyncSnapshot.connectionState == ConnectionState.done
                        ? Image.asset(
                            assetImage!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              // Tratamento de Erro na Imagem
                              return Image.asset("assets/images/error_404.jpg");
                            },
                          )
                        : const Center(
                            // Contrução do Loading da Imagem
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(),
                            ),
                          );
                  },
                )
              : Image.asset(
                  "assets/images/error_404.jpg",
                  fit: BoxFit.cover,
                ),
    );
  }
}
