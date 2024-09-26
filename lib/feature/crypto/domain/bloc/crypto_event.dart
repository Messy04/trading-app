import 'package:equatable/equatable.dart';
import 'package:trading_app/core/utils/app_typedefs.dart';

abstract class CryptoEvent extends Equatable {
  const CryptoEvent();

  @override
  List<Object?> get props => [];
}

class GetCryptoListEvent extends CryptoEvent {
  final String currency;

  const GetCryptoListEvent({this.currency = 'usd'});
}

class StreamRealTimeDataEvent extends CryptoEvent {
  final String symbol;

  const StreamRealTimeDataEvent({required this.symbol});
}

class DataFailedEvent extends CryptoEvent {
  final String message;

  const DataFailedEvent({required this.message});
}

class CloseWebSocketConnectionEvent extends CryptoEvent {
  const CloseWebSocketConnectionEvent();
}
