import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/core/constants/dimension.dart';
import 'package:trading_app/core/constants/spacing.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_detail_bloc.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_event.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_state.dart';
import 'package:trading_app/feature/crypto/domain/entity/symbol_entity.dart';
import 'package:trading_app/feature/crypto/domain/entity/crypto_ticker_entity.dart';
import 'package:trading_app/feature/crypto/presentation/widgets/coin_image_avatar.dart';
import 'package:trading_app/feature/crypto/presentation/widgets/coin_price_change_row.dart';
import 'package:trading_app/feature/crypto/presentation/widgets/error_display_widget.dart';
import 'package:trading_app/generated/l10n.dart';

class CryptoDetailPage extends StatelessWidget {
  final SymbolEntity coinInfo;

  const CryptoDetailPage({required this.coinInfo, super.key});

  void addStreamEvent(BuildContext context) {
    context.read<CryptoDetailBloc>().add(
          StreamRealTimeDataEvent(
            symbol: coinInfo.symbol ?? '',
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          coinInfo.name?.toUpperCase() ?? '',
          style: const TextStyle(
            fontSize: Dimension.s24,
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:
          BlocBuilder<CryptoDetailBloc, CryptoState>(builder: (context, state) {
        if (state is DataFailedState) {
          return ErrorDisplayWidget(message: state.message);
        }
        addStreamEvent(context);
        return StreamBuilder(
            stream: context.read<CryptoDetailBloc>().controller.stream,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                  return _buildDataBody(snapshot);
                case ConnectionState.done:
                  return const Center(
                    child: Icon(
                      Icons.hourglass_bottom_sharp,
                      size: Dimension.s100,
                    ),
                  );
              }
            });
      }),
    );
  }

  Widget _buildDataBody(AsyncSnapshot<CryptoTickerEntity> snapshot) {
    return Padding(
      padding: const EdgeInsets.all(Dimension.s24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '#${coinInfo.marketCapRank}',
            style: const TextStyle(
              fontSize: Dimension.s24,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          HeightBox.size16,
          Row(
            children: [
              CoinImageAvatar(coinInfo.image ?? ''),
              WidthBox.size8,
              Text(
                coinInfo.symbol?.toUpperCase() ?? '',
                style: const TextStyle(
                  fontSize: Dimension.s28,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                '${AppLocalization.current.dollarSymbol}${snapshot.data?.lastPrice ?? 0}',
                style: const TextStyle(
                  fontSize: Dimension.s24,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          HeightBox.size16,
          CoinPriceChangeRow(
            priceChange: snapshot.data?.priceChange ?? 0,
            priceChangePercent: snapshot.data?.priceChangePercent ?? 0,
          ),
        ],
      ),
    );
  }
}
