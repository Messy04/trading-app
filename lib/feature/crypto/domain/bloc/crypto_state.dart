import 'package:equatable/equatable.dart';
import 'package:trading_app/core/utils/app_typedefs.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();

  @override
  List<Object?> get props => [];
}

class CryptoInitialListLoadingState extends CryptoState {}

class CryptoListState extends CryptoState {
  final SymbolEntityList cryptoList;

  const CryptoListState(this.cryptoList);
}

class DataFailedState extends CryptoState {
  final String message;

  const DataFailedState(this.message);
}
