import 'package:trading_app/feature/crypto/data/model/symbol.dart';
import 'package:trading_app/feature/crypto/data/model/crypto_ticker.dart';
import 'package:trading_app/feature/crypto/domain/entity/symbol_entity.dart';
import 'package:trading_app/feature/crypto/domain/entity/crypto_ticker_entity.dart';

typedef SymbolEntityList = List<SymbolEntity>;
typedef SymbolList = List<Symbol>;
typedef CryptoTickerStream = Stream<CryptoTicker>;
typedef CryptoTickerEntityStream = Stream<CryptoTickerEntity>;