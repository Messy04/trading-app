import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_event.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_state.dart';
import 'package:trading_app/feature/crypto/domain/repository/crypto_list_repository.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_bloc.dart';
import 'package:trading_app/generated/l10n.dart';

class CryptoListBloc extends CryptoBloc {
  final CryptoListRepository cryptoRepository;

  CryptoListBloc({required this.cryptoRepository}) {
    on<GetCryptoListEvent>(_onGetCryptoListEvent);

    add(const GetCryptoListEvent());
  }

  Future<void> _onGetCryptoListEvent(
    GetCryptoListEvent event,
    Emitter<CryptoState> emit,
  ) async {
    try {
      final response = await cryptoRepository.getCryptoList(event.currency);
      if (response.error != null) {
        emit(
          DataFailedState(
            response.error?.message ??
                AppLocalization.current.somethingWentWrong,
          ),
        );
      } else {
        emit(CryptoListState(response.data ?? []));
      }
    } on SocketException catch (e) {
      emit(DataFailedState(e.message));
    } on TimeoutException catch (e) {
      emit(
          DataFailedState(e.message ?? AppLocalization.current.requestTimeout));
    } on DioException catch (e) {
      emit(DataFailedState(
        e.message ?? AppLocalization.current.somethingWentWrong,
      ));
    } catch (error) {
      emit(DataFailedState(AppLocalization.current.somethingWentWrong));
    }
  }
}
