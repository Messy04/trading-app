import 'package:dio/dio.dart';
import 'package:trading_app/core/constants/constants.dart';
import 'package:retrofit/retrofit.dart';

part 'crypto_api_service.g.dart';

@RestApi(baseUrl: coinGeckoBaseUrl)
abstract class CryptoApiService {
  factory CryptoApiService(Dio dio) = _CryptoApiService;
  
  @GET('/coins/markets')
  Future<HttpResponse<void>> getCryptoList({
    @Query('vs_currency') String? currency,
  });
}
