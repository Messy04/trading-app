import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_detail_bloc.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_event.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_state.dart';
import 'package:trading_app/feature/crypto/presentation/page/crypto_detail_page.dart';
import 'package:trading_app/feature/crypto/presentation/widgets/error_display_widget.dart';
import 'package:trading_app/generated/l10n.dart';

import '../../../test_helper.dart';

class MockCryptoDetailBloc extends MockBloc<CryptoEvent, CryptoState>
    implements CryptoDetailBloc {}

void main() {
  late MockCryptoDetailBloc mockCryptoDetailBloc;

  setUp(() {
    mockCryptoDetailBloc = MockCryptoDetailBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<CryptoDetailBloc>(
      create: (context) => mockCryptoDetailBloc,
      child: MaterialApp(
        home: body,
        localizationsDelegates: const [AppLocalization.delegate],
      ),
    );
  }

  group('CryptoDetailPage widgets testing', () {
    testWidgets('DataFailedState', (widgetTester) async {
      // Arrange
      when(() => mockCryptoDetailBloc.state)
          .thenReturn(const DataFailedState('Error'));

      // Act
      await widgetTester.pumpWidget(
          makeTestableWidget(CryptoDetailPage(coinInfo: mockCryptoList.first)));
      final errorWidget = find.byType(ErrorDisplayWidget);

      // Expect
      expect(errorWidget, findsOneWidget);
    });
  });
}
