import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_event.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc() : super(CryptoInitialListLoadingState()) {
    on<DataFailedEvent>(_onDataFailedEvent);
  }

  void _onDataFailedEvent(DataFailedEvent event, Emitter<CryptoState> emit) {
    emit(DataFailedState(event.message));
  }
}
