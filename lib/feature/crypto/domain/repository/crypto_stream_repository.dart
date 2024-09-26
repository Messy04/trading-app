import 'package:trading_app/core/utils/app_typedefs.dart';

abstract class CryptoStreamRepository {
  CryptoTickerEntityStream streamCryptoTickerData(String symbol);

  Future<void> closeStream();
}