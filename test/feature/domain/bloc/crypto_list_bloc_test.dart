import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trading_app/core/resources/data_state.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_bloc.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_event.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_list_bloc.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_state.dart';
import 'package:trading_app/generated/l10n.dart';

import '../../../test_helper.dart';
import '../../../test_helper.mocks.dart';

Future<void> main() async {
  late CryptoBloc cryptoListBloc;
  late MockCryptoListRepository mockCryptoRepository;

  await AppLocalization.load(const Locale.fromSubtags(languageCode: 'en'));

  setUp(() {
    mockCryptoRepository = MockCryptoListRepository();
    cryptoListBloc = CryptoListBloc(cryptoRepository: mockCryptoRepository);
  });

  test('Initial state should be [DataFailedState]', () {
    expect(cryptoListBloc.state, const DataFailedState('Error'));
  });

  blocTest<CryptoListBloc, CryptoState>(
    'Data Failed State',
    // Arrange Phase
    build: () {
      when(mockCryptoRepository.getCryptoList('usd')).thenAnswer(
            (_) async => Future(() => DataFailed(mockError)),
      );
      return cryptoListBloc as CryptoListBloc;
    },

    // Act Phase
    act: (bloc) => bloc.add(const GetCryptoListEvent(currency: 'usd')),
    wait: const Duration(milliseconds: 500),

    // Assert Phase
    expect: () => [const DataFailedState('Error')],
    tearDown: () => cryptoListBloc.close(),
  );

  blocTest<CryptoListBloc, CryptoState>(
    'Crypto List State',
    // Arrange Phase
    build: () {
      when(mockCryptoRepository.getCryptoList('usd')).thenAnswer(
        (_) async => Future(() => DataSuccess(mockCryptoList)),
      );
      return cryptoListBloc as CryptoListBloc;
    },

    // Act Phase
    act: (bloc) => bloc.add(const GetCryptoListEvent(currency: 'usd')),
    wait: const Duration(milliseconds: 500),

    // Assert Phase
    expect: () => [CryptoListState(mockCryptoList)],
    tearDown: () => cryptoListBloc.close(),
  );
}
