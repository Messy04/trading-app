import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/config/route/route_names.dart';
import 'package:trading_app/core/constants/dimension.dart';
import 'package:trading_app/core/constants/spacing.dart';
import 'package:trading_app/core/utils/app_typedefs.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_list_bloc.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_state.dart';
import 'package:trading_app/feature/crypto/presentation/widgets/coin_info_card.dart';
import 'package:trading_app/feature/crypto/presentation/widgets/error_display_widget.dart';
import 'package:trading_app/generated/l10n.dart';

class CryptoListPage extends StatelessWidget {
  const CryptoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalization.of(context).cryptoTitle,
          style: const TextStyle(
            fontSize: Dimension.s24,
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<CryptoListBloc, CryptoState>(
        buildWhen: (previous, current) =>
            current is CryptoInitialListLoadingState ||
            current is CryptoListState ||
            current is DataFailedState,
        builder: (context, state) {
          if (state is CryptoListState) {
            return _buildInfoCardBody(state.cryptoList);
          } else if (state is DataFailedState) {
            return ErrorDisplayWidget(message: state.message);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildInfoCardBody(SymbolEntityList list) {
    return Padding(
      padding: const EdgeInsets.all(Dimension.s20),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final data = list[index];
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    Routes.cryptoDetail,
                    arguments: data,
                  );
                },
                child: CoinInfoCard(
                  imageUrl: data.image ?? "",
                  coinName: data.symbol ?? "",
                  currentPrice: data.currentPrice ?? 0,
                  marketCapRank: data.marketCapRank ?? 0,
                ),
              ),
              HeightBox.size16,
            ],
          );
        },
      ),
    );
  }
}
