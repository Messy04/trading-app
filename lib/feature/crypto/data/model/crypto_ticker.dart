import 'package:trading_app/feature/crypto/domain/entity/crypto_ticker_entity.dart';

class CryptoTicker extends CryptoTickerEntity {

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

  const CryptoTicker({
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

  factory CryptoTicker.fromJson(Map<String, dynamic> json) {
    return CryptoTicker(
      eventType: json['e'] as String?,
      eventTime: json['E'] as int?,
      symbol: json['s'] as String?,
      priceChange: (json['p'] != null) ? double.tryParse(json['p']) : null,
      priceChangePercent:
          (json['P'] != null) ? double.tryParse(json['P']) : null,
      weightedAvgPrice: (json['w'] != null) ? double.tryParse(json['w']) : null,
      previousClose: (json['x'] != null) ? double.tryParse(json['x']) : null,
      lastPrice: (json['c'] != null) ? double.tryParse(json['c']) : null,
      lastQty: (json['Q'] != null) ? double.tryParse(json['Q']) : null,
      bidPrice: (json['b'] != null) ? double.tryParse(json['b']) : null,
      bidQty: (json['B'] != null) ? double.tryParse(json['B']) : null,
      askPrice: (json['a'] != null) ? double.tryParse(json['a']) : null,
      askQty: (json['A'] != null) ? double.tryParse(json['A']) : null,
      openPrice: (json['o'] != null) ? double.tryParse(json['o']) : null,
      highPrice: (json['h'] != null) ? double.tryParse(json['h']) : null,
      lowPrice: (json['l'] != null) ? double.tryParse(json['l']) : null,
      volume: (json['v'] != null) ? double.tryParse(json['v']) : null,
      quoteVolume: (json['q'] != null) ? double.tryParse(json['q']) : null,
      openTime: json['O'] as int?,
      closeTime: json['C'] as int?,
      firstTradeId: json['F'] as int?,
      lastTradeId: json['L'] as int?,
      tradeCount: json['n'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'e': eventType,
      'E': eventTime,
      's': symbol,
      'p': priceChange?.toString(),
      'P': priceChangePercent?.toString(),
      'w': weightedAvgPrice?.toString(),
      'x': previousClose?.toString(),
      'c': lastPrice?.toString(),
      'Q': lastQty?.toString(),
      'b': bidPrice?.toString(),
      'B': bidQty?.toString(),
      'a': askPrice?.toString(),
      'A': askQty?.toString(),
      'o': openPrice?.toString(),
      'h': highPrice?.toString(),
      'l': lowPrice?.toString(),
      'v': volume?.toString(),
      'q': quoteVolume?.toString(),
      'O': openTime,
      'C': closeTime,
      'F': firstTradeId,
      'L': lastTradeId,
      'n': tradeCount,
    };
  }
}
