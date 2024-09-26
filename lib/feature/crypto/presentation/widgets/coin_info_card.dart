import 'package:flutter/material.dart';
import 'package:trading_app/core/constants/dimension.dart';
import 'package:trading_app/core/constants/spacing.dart';
import 'package:trading_app/feature/crypto/presentation/widgets/coin_image_avatar.dart';
import 'package:trading_app/generated/l10n.dart';

class CoinInfoCard extends StatelessWidget {
  final String imageUrl;
  final String coinName;
  final double currentPrice;
  final int marketCapRank;

  const CoinInfoCard({
    required this.imageUrl,
    required this.coinName,
    required this.currentPrice,
    required this.marketCapRank,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimension.s24),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: Dimension.s0pt25),
        borderRadius: BorderRadius.circular(Dimension.s12),
      ),
      child: Row(
        children: [
          CoinImageAvatar(imageUrl),
          WidthBox.size16,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coinName.toUpperCase(),
                style: const TextStyle(
                  fontSize: Dimension.s28,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${AppLocalization.of(context).dollarSymbol}$currentPrice',
                style: const TextStyle(
                  fontSize: Dimension.s24,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.keyboard_arrow_right_sharp,
          )
        ],
      ),
    );
  }
}
