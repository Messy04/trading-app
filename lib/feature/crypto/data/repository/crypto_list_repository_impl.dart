import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:trading_app/core/resources/data_state.dart';
import 'package:trading_app/core/utils/app_typedefs.dart';
import 'package:trading_app/feature/crypto/data/data_source/crypto_api_service.dart';
import 'package:trading_app/feature/crypto/data/model/symbol.dart';
import 'package:trading_app/feature/crypto/domain/repository/crypto_list_repository.dart';

class CryptoListRepositoryImpl implements CryptoListRepository {
  final CryptoApiService cryptoApiService;

  CryptoListRepositoryImpl({required this.cryptoApiService});

  @override
  Future<DataState<SymbolList>> getCryptoList(String currency) async {
    try {
      final httpResponse =
          await cryptoApiService.getCryptoList(currency: currency);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final response = httpResponse.response;
        final jsonList = response.data as List<dynamic>;

        var cryptoList = jsonList.map((item) {
          return Symbol.fromJson(item);
        }).toList();
        return DataSuccess(cryptoList);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(DioException(
        error: e,
        requestOptions: RequestOptions(),
      ));
    }
  }
}
