import 'package:flutter/material.dart';
import 'package:trading_app/core/constants/dimension.dart';
import 'package:trading_app/core/constants/spacing.dart';
import 'package:trading_app/generated/l10n.dart';

class ErrorDisplayWidget extends StatelessWidget {
  const ErrorDisplayWidget({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalization.of(context).errorTitle,
            style: const TextStyle(
              fontSize: Dimension.s48,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          HeightBox.size32,
          const Icon(
            Icons.error,
            color: Colors.red,
            size: Dimension.s100,
          ),
          HeightBox.size32,
          Text(
            message,
            style: const TextStyle(
              fontSize: Dimension.s32,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
