import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_bloc.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_event.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_state.dart';
import 'package:trading_app/feature/crypto/domain/entity/crypto_ticker_entity.dart';
import 'package:trading_app/feature/crypto/domain/repository/crypto_stream_repository.dart';
import 'package:trading_app/generated/l10n.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CryptoDetailBloc extends CryptoBloc {
  final CryptoStreamRepository cryptoStreamRepository;

  CryptoDetailBloc({required this.cryptoStreamRepository}) {
    on<StreamRealTimeDataEvent>(_onStreamRealTimeDataEvent);
    on<CloseWebSocketConnectionEvent>(_onCloseWebSocketConnectionEvent);
  }

  final controller = StreamController<CryptoTickerEntity>();

  @override
  Future<void> close() {
    add(const CloseWebSocketConnectionEvent());
    return super.close();
  }

  Future<void> _onStreamRealTimeDataEvent(
    StreamRealTimeDataEvent event,
    Emitter<CryptoState> emit,
  ) async {
    try {
      cryptoStreamRepository
          .streamCryptoTickerData(event.symbol)
          .listen((data) {
        controller.add(data);
      }).onError((error) {
        add(DataFailedEvent(message: error.toString()));
      });
    } on SocketException catch (e) {
      emit(DataFailedState(e.message));
    } on WebSocketChannelException catch (e) {
      emit(DataFailedState(
        e.message ?? AppLocalization.current.unableToConnect,
      ));
    } on TimeoutException catch (e) {
      emit(
        DataFailedState(e.message ?? AppLocalization.current.requestTimeout),
      );
    } on DioException catch (e) {
      emit(DataFailedState(
        e.message ?? AppLocalization.current.somethingWentWrong,
      ));
    } catch (error) {
      emit(DataFailedState(AppLocalization.current.somethingWentWrong));
    }
  }

  Future<void> _onCloseWebSocketConnectionEvent(
    CloseWebSocketConnectionEvent event,
    Emitter<CryptoState> emit,
  ) async {
    await cryptoStreamRepository.closeStream();
    controller.sink.close();
    controller.close();
  }
}
