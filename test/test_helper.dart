import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:trading_app/feature/crypto/data/model/symbol.dart';
import 'package:trading_app/feature/crypto/data/model/crypto_ticker.dart';
import 'package:trading_app/feature/crypto/domain/repository/crypto_list_repository.dart';
import 'package:trading_app/feature/crypto/domain/repository/crypto_stream_repository.dart';

@GenerateMocks(
  [CryptoListRepository, CryptoStreamRepository],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}

// MOCK DATA
final mockCryptoList = mockCryptoJsonList.map((item) {
  return Symbol.fromJson(item);
}).toList();

final mockCryptoTicker = CryptoTicker.fromJson(mockCryptoTicketEntityJson);

final mockError =
    DioException(requestOptions: RequestOptions(), message: 'Error');

// JSON
const mockCryptoTicketEntityJson = {
  "e": "24hrTicker",
  "E": 1727270580762,
  "s": "BTCUSDT",
  "p": "-60.34000000",
  "P": "-0.095",
  "w": "63835.46978700",
  "x": "63550.00000000",
  "c": "63489.66000000",
  "Q": "0.00140000",
  "b": "63489.65000000",
  "B": "0.00010000",
  "a": "63489.66000000",
  "A": "1.30119000",
  "o": "63550.00000000",
  "h": "64817.99000000",
  "l": "62731.10000000",
  "v": "21978.78050000",
  "q": "1403025778.56287920",
  "O": 1727184180762,
  "C": 1727270580762,
  "F": 3851224675,
  "L": 3855054343,
  "n": 3829669,
};

const mockCryptoJsonList = [
  {
    "id": "bitcoin",
    "symbol": "btc",
    "name": "Bitcoin",
    "image":
        "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
    "current_price": 63851,
    "market_cap": 1262090815043,
    "market_cap_rank": 1,
    "fully_diluted_valuation": 1341400547529,
    "total_volume": 25115445789,
    "high_24h": 63870,
    "low_24h": 62742,
    "price_change_24h": 535.8,
    "price_change_percentage_24h": 0.84624,
    "market_cap_change_24h": 13292122704,
    "market_cap_change_percentage_24h": 1.06439,
    "circulating_supply": 19758384,
    "total_supply": 21000000,
    "max_supply": 21000000,
    "ath": 73738,
    "ath_change_percentage": -13.59061,
    "ath_date": "2024-03-14T07:10:36.635Z",
    "atl": 67.81,
    "atl_change_percentage": 93864.66678,
    "atl_date": "2013-07-06T00:00:00.000Z",
    "roi": null,
    "last_updated": "2024-09-24T17:52:46.240Z"
  },
  {
    "id": "ethereum",
    "symbol": "eth",
    "name": "Ethereum",
    "image":
        "https://coin-images.coingecko.com/coins/images/279/large/ethereum.png?1696501628",
    "current_price": 2648.62,
    "market_cap": 318990508464,
    "market_cap_rank": 2,
    "fully_diluted_valuation": 318990508464,
    "total_volume": 16256693716,
    "high_24h": 2685.3,
    "low_24h": 2593.6,
    "price_change_24h": -19.61149335208802,
    "price_change_percentage_24h": -0.735,
    "market_cap_change_24h": -1466458564.463379,
    "market_cap_change_percentage_24h": -0.45761,
    "circulating_supply": 120362207.963138,
    "total_supply": 120362207.963138,
    "max_supply": null,
    "ath": 4878.26,
    "ath_change_percentage": -45.7428,
    "ath_date": "2021-11-10T14:24:19.604Z",
    "atl": 0.432979,
    "atl_change_percentage": 611201.80923,
    "atl_date": "2015-10-20T00:00:00.000Z",
    "roi": {
      "times": 54.47045495573061,
      "currency": "btc",
      "percentage": 5447.045495573061
    },
    "last_updated": "2024-09-24T17:52:45.156Z"
  },
  {
    "id": "tether",
    "symbol": "usdt",
    "name": "Tether",
    "image":
        "https://coin-images.coingecko.com/coins/images/325/large/Tether.png?1696501661",
    "current_price": 1,
    "market_cap": 119259716534,
    "market_cap_rank": 3,
    "fully_diluted_valuation": 119259716534,
    "total_volume": 47587740096,
    "high_24h": 1.002,
    "low_24h": 0.997431,
    "price_change_24h": -0.000358145630996454,
    "price_change_percentage_24h": -0.0358,
    "market_cap_change_24h": 38015355,
    "market_cap_change_percentage_24h": 0.03189,
    "circulating_supply": 119243573831.052,
    "total_supply": 119243573831.052,
    "max_supply": null,
    "ath": 1.32,
    "ath_change_percentage": -24.38593,
    "ath_date": "2018-07-24T00:00:00.000Z",
    "atl": 0.572521,
    "atl_change_percentage": 74.74401,
    "atl_date": "2015-03-02T00:00:00.000Z",
    "roi": null,
    "last_updated": "2024-09-24T17:52:42.410Z"
  },
  {
    "id": "binancecoin",
    "symbol": "bnb",
    "name": "BNB",
    "image":
        "https://coin-images.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1696501970",
    "current_price": 608.54,
    "market_cap": 88809391072,
    "market_cap_rank": 4,
    "fully_diluted_valuation": 88809391072,
    "total_volume": 863304851,
    "high_24h": 615.4,
    "low_24h": 600.67,
    "price_change_24h": -0.5052788579358776,
    "price_change_percentage_24h": -0.08296,
    "market_cap_change_24h": 109574873,
    "market_cap_change_percentage_24h": 0.12353,
    "circulating_supply": 145887575.79,
    "total_supply": 145887575.79,
    "max_supply": 200000000,
    "ath": 717.48,
    "ath_change_percentage": -15.22118,
    "ath_date": "2024-06-06T14:10:59.816Z",
    "atl": 0.0398177,
    "atl_change_percentage": 1527530.05104,
    "atl_date": "2017-10-19T00:00:00.000Z",
    "roi": null,
    "last_updated": "2024-09-24T17:52:36.972Z"
  },
  {
    "id": "solana",
    "symbol": "sol",
    "name": "Solana",
    "image":
        "https://coin-images.coingecko.com/coins/images/4128/large/solana.png?1718769756",
    "current_price": 148.02,
    "market_cap": 69395235143,
    "market_cap_rank": 5,
    "fully_diluted_valuation": 86643258485,
    "total_volume": 3081735162,
    "high_24h": 148.42,
    "low_24h": 142.81,
    "price_change_24h": 4.41,
    "price_change_percentage_24h": 3.07364,
    "market_cap_change_24h": 2098794863,
    "market_cap_change_percentage_24h": 3.11873,
    "circulating_supply": 468729550.095328,
    "total_supply": 585231183.165261,
    "max_supply": null,
    "ath": 259.96,
    "ath_change_percentage": -42.95282,
    "ath_date": "2021-11-06T21:54:35.825Z",
    "atl": 0.500801,
    "atl_change_percentage": 29512.43156,
    "atl_date": "2020-05-11T19:35:23.449Z",
    "roi": null,
    "last_updated": "2024-09-24T17:52:40.376Z"
  },
];
