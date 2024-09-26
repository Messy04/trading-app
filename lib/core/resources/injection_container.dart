import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:trading_app/feature/crypto/data/data_source/crypto_api_service.dart';
import 'package:trading_app/feature/crypto/data/repository/crypto_list_repository_impl.dart';
import 'package:trading_app/feature/crypto/data/repository/crypto_stream_repository_impl.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_detail_bloc.dart';
import 'package:trading_app/feature/crypto/domain/bloc/crypto_list_bloc.dart';
import 'package:trading_app/feature/crypto/domain/repository/crypto_list_repository.dart';
import 'package:trading_app/feature/crypto/domain/repository/crypto_stream_repository.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Adapters
  injector.registerSingleton<Dio>(Dio());

  // Services
  injector.registerSingleton<CryptoApiService>(CryptoApiService(injector()));

  // Repositories
  injector.registerSingleton<CryptoListRepository>(
    CryptoListRepositoryImpl(cryptoApiService: injector()),
  );

  injector.registerSingleton<CryptoStreamRepository>(
    CryptoStreamRepositoryImpl(),
  );

  // Blocs
  injector.registerFactory<CryptoListBloc>(
    () => CryptoListBloc(cryptoRepository: injector()),
  );

  injector.registerFactory<CryptoDetailBloc>(
    () => CryptoDetailBloc(cryptoStreamRepository: injector()),
  );
}
