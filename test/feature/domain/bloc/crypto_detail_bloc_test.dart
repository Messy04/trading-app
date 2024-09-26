import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_bloc.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_detail_bloc.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_state.dart';
import 'package:trading_app/feature/crypto/domain/entity/crypto_ticker_entity.dart';

import '../../../test_helper.dart';
import '../../../test_helper.mocks.dart';

void main() {
  late CryptoBloc cryptoDetailBloc;
  late MockCryptoStreamRepository mockCryptoStreamRepository;

  final controller = StreamController<CryptoTickerEntity>();

  setUp(() {
    mockCryptoStreamRepository = MockCryptoStreamRepository();
    cryptoDetailBloc = CryptoDetailBloc(
      cryptoStreamRepository: mockCryptoStreamRepository,
    );
  });

  test('Initial state should be [CryptoInitialListLoadingState]', () {
    expect(cryptoDetailBloc.state, CryptoInitialListLoadingState());
  });

  controller.add(mockCryptoTicker);
  test('should be a single stream', () {
    expect(controller.stream.isBroadcast, false);
  });

  controller.add(mockCryptoTicker);
  test('should emit CryptoTickerEntity', () {
    expect(controller.stream, emits(mockCryptoTicker));
  });

  controller.add(mockCryptoTicker);
  test('should not emit null value', () {
    expect(controller.stream, neverEmits(null));
  });
  controller.sink.close();
  controller.close();
}
