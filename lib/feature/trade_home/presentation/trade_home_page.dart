import 'package:flutter/material.dart';
import 'package:trading_app/config/route/route_names.dart';
import 'package:trading_app/core/constants/dimension.dart';
import 'package:trading_app/generated/l10n.dart';

class TradeHomePage extends StatelessWidget {
  const TradeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.cryptoList);
          },
          child: Text(
            AppLocalization.of(context).cryptoTitle,
            style: const TextStyle(
              fontSize: Dimension.s28,
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
