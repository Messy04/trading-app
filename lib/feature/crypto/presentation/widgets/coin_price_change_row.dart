import 'package:flutter/material.dart';
import 'package:trading_app/core/constants/dimension.dart';
import 'package:trading_app/core/constants/spacing.dart';

class CoinPriceChangeRow extends StatelessWidget {
  final double priceChange;
  final double priceChangePercent;

  const CoinPriceChangeRow({
    required this.priceChange,
    required this.priceChangePercent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return buildRow(isLoss: priceChange <= 0 || priceChangePercent <= 0);
  }

  Row buildRow({required bool isLoss}) {
    return Row(
      children: [
        Icon(
          isLoss
              ? Icons.keyboard_arrow_down_outlined
              : Icons.keyboard_arrow_up_outlined,
          size: Dimension.s48,
          color: isLoss ? Colors.red : Colors.green,
        ),
        Text(
          '$priceChangePercent%',
          style: TextStyle(
            fontSize: Dimension.s24,
            color: isLoss ? Colors.red : Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        WidthBox.size8,
        Text(
          '($priceChange)',
          style: TextStyle(
            fontSize: Dimension.s20,
            color: isLoss ? Colors.red : Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
