import 'package:equatable/equatable.dart';

class CryptoTickerEntity extends Equatable {

  final String? eventType;
  final int? eventTime;
  final String? symbol;
  final double? priceChange;
  final double? priceChangePercent;
  final double? weightedAvgPrice;
  final double? previousClose;
  final double? lastPrice;
  final double? lastQty;
  final double? bidPrice;
  final double? bidQty;
  final double? askPrice;
  final double? askQty;
  final double? openPrice;
  final double? highPrice;
  final double? lowPrice;
  final double? volume;
  final double? quoteVolume;
  final int? openTime;
  final int? closeTime;
  final int? firstTradeId;
  final int? lastTradeId;
  final int? tradeCount;

  const CryptoTickerEntity({
    this.eventType,
    this.eventTime,
    this.symbol,
    this.priceChange,
    this.priceChangePercent,
    this.weightedAvgPrice,
    this.previousClose,
    this.lastPrice,
    this.lastQty,
    this.askQty,
    this.bidPrice,
    this.bidQty,
    this.askPrice,
    this.openPrice,
    this.highPrice,
    this.lowPrice,
    this.volume,
    this.quoteVolume,
    this.openTime,
    this.closeTime,
    this.firstTradeId,
    this.lastTradeId,
    this.tradeCount,
  });


  @override
  List<Object?> get props => [
    eventType,
    eventTime,
    symbol,
    priceChange,
    priceChangePercent,
    weightedAvgPrice,
    previousClose,
    lastPrice,
    lastQty,
    bidPrice,
    bidQty,
    askPrice,
    askQty,
    openPrice,
    highPrice,
    lowPrice,
    volume,
    quoteVolume,
    openTime,
    closeTime,
    firstTradeId,
    lastTradeId,
    tradeCount,
  ];
}