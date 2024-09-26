import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/core/constants/dimension.dart';

class CoinImageAvatar extends StatelessWidget {
  final String imageUrl;

  const CoinImageAvatar(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimension.s50,
      width: Dimension.s50,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
