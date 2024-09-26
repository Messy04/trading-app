import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/core/resources/injection_container.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_detail_bloc.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_list_bloc.dart';
import 'package:trading_app/feature/crypto/domain/entity/symbol_entity.dart';
import 'package:trading_app/feature/crypto/presentation/page/crypto_detail_page.dart';
import 'package:trading_app/feature/crypto/presentation/page/crypto_list_page.dart';
import 'package:trading_app/feature/trade_home/presentation/trade_home_page.dart';

import 'route_names.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case Routes.tradeHome:
      return homeRoute();
    case Routes.cryptoList:
      return cryptoListRoute();
    case Routes.cryptoDetail:
      final entity = setting.arguments as SymbolEntity;
      return cryptoDetailRoute(entity);
    default:
      return homeRoute();
  }
}

MaterialPageRoute<dynamic> homeRoute() {
  return MaterialPageRoute(builder: (context) {
    return const TradeHomePage();
  });
}

MaterialPageRoute<dynamic> cryptoListRoute() {
  return MaterialPageRoute(builder: (context) {
    return BlocProvider(
      create: (BuildContext context) => CryptoListBloc(
        cryptoRepository: injector(),
      ),
      child: const CryptoListPage(),
    );
  });
}

MaterialPageRoute<dynamic> cryptoDetailRoute(SymbolEntity entity) {
  return MaterialPageRoute(builder: (context) {
    return BlocProvider(
      create: (BuildContext context) => CryptoDetailBloc(
        cryptoStreamRepository: injector(),
      ),
      child: CryptoDetailPage(coinInfo: entity),
    );
  });
}
