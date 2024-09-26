import 'package:trading_app/config/route/app_routes.dart';
import 'package:trading_app/core/resources/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/feature/trade_home/presentation/trade_home_page.dart';
import 'package:trading_app/generated/l10n.dart';

void main() {
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trading App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const [AppLocalization.delegate],
      home: const TradeHomePage(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
