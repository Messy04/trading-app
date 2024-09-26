import 'package:trading_app/core/resources/data_state.dart';
import 'package:trading_app/core/utils/app_typedefs.dart';

abstract class CryptoListRepository {
  Future<DataState<SymbolEntityList>> getCryptoList(String currency);
}