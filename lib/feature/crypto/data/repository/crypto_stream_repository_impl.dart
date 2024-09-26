import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trading_app/core/constants/constants.dart';
import 'package:trading_app/core/utils/app_typedefs.dart';
import 'package:trading_app/feature/crypto/data/model/crypto_ticker.dart';
import 'package:trading_app/feature/crypto/domain/repository/crypto_stream_repository.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CryptoStreamRepositoryImpl implements CryptoStreamRepository {
  WebSocketChannel? channel;
  var controller = StreamController<CryptoTicker>();

  @override
  CryptoTickerStream streamCryptoTickerData(String symbol) {
    channel =  WebSocketChannel.connect(
      Uri.parse('$binanceWebsocketUrl/${symbol}usdt@ticker'),
    );

    controller = StreamController<CryptoTicker>();
    channel?.stream.listen((item) {
      var jsonData = jsonDecode(item);
      debugPrint(item);
      final data = CryptoTicker.fromJson(jsonData);
      controller.add(data);
    });
    return controller.stream;
  }

  @override
  Future<void> closeStream() async {
    await channel?.sink.close();
    controller.close();
  }
}