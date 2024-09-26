import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trading_app/config/route/app_routes.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_event.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_list_bloc.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_state.dart';
import 'package:trading_app/feature/crypto/presentation/page/crypto_detail_page.dart';
import 'package:trading_app/feature/crypto/presentation/page/crypto_list_page.dart';
import 'package:trading_app/feature/crypto/presentation/widgets/coin_info_card.dart';
import 'package:trading_app/feature/crypto/presentation/widgets/error_display_widget.dart';
import 'package:trading_app/generated/l10n.dart';

import '../../../test_helper.dart';

class MockCryptoListBloc extends MockBloc<CryptoEvent, CryptoState>
    implements CryptoListBloc {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  late MockCryptoListBloc mockCryptoListBloc;
  late MockNavigatorObserver mockObserver;

  setUp(() {
    mockCryptoListBloc = MockCryptoListBloc();
    mockObserver = MockNavigatorObserver();
  });

  Widget makeTestableWidget(Widget body) {
    // initializeDependencies();
    return BlocProvider<CryptoListBloc>(
      create: (context) => mockCryptoListBloc,
      child: MaterialApp(
        home: body,
        localizationsDelegates: const [AppLocalization.delegate],
        // onGenerateRoute: onGenerateRoute,
      ),
    );
  }

  group('CryptoListPage widgets testing', () {
    testWidgets('CryptoInitialListLoadingState', (widgetTester) async {
      // Arrange
      when(() => mockCryptoListBloc.state)
          .thenReturn(CryptoInitialListLoadingState());

      // Act
      await widgetTester.pumpWidget(makeTestableWidget(const CryptoListPage()));
      final indicator = find.byType(CircularProgressIndicator);

      // Expect
      expect(indicator, findsOneWidget);
    });

    testWidgets('DataFailedState', (widgetTester) async {
      // Arrange
      when(() => mockCryptoListBloc.state)
          .thenReturn(const DataFailedState('Error'));

      // Act
      await widgetTester.pumpWidget(makeTestableWidget(const CryptoListPage()));
      final errorWidget = find.byType(ErrorDisplayWidget);

      // Expect
      expect(errorWidget, findsOneWidget);
    });

    testWidgets('CryptoListState', (widgetTester) async {
      // Arrange
      when(() => mockCryptoListBloc.state)
          .thenReturn(CryptoListState(mockCryptoList));

      // Act
      await widgetTester.pumpWidget(makeTestableWidget(const CryptoListPage()));
      final cardWidget = find.byType(CoinInfoCard);

      // Expect
      expect(cardWidget, findsExactly(4));

      // Tap the 'CoinInfoCard'.
      // await widgetTester.tap(find.ancestor(
      //     of: find.byType(CoinInfoCard), matching: find.byType(InkWell)));
      // await widgetTester.pumpAndSettle();
      //
      // /// Verify that a push event happened
      // verify(() => mockObserver.didPush(
      //     cryptoDetailRoute(mockCryptoList.first), cryptoListRoute()));
      //
      // /// You'd also want to be sure that your page is now
      // /// present in the screen.
      // expect(find.byType(CryptoDetailPage), findsOneWidget);
    });
  });
}
