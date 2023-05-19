import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:payment_tutorial/core/api/dio_consumer.dart';
import 'package:payment_tutorial/features/business/cubit/payment_cubit.dart';
import 'package:payment_tutorial/features/data/repository/payment_repository.dart';
import 'package:payment_tutorial/features/data/web_services/payment_web_services.dart';

import '../api/app_interceptor.dart';

final GetIt sl = GetIt.instance;

class DependencyInjectionServices {
  Future<void> init() async {
    // Web Services
    sl.registerLazySingleton(
        () => PaymentWebServices(dioConsumer: sl<DioConsumer>()));

    // Repository
    sl.registerLazySingleton(
        () => PaymentRepository(services: sl<PaymentWebServices>()));
    // Bloc

    sl.registerFactory(
        () => PaymentCubit(paymentRepository: sl<PaymentRepository>()));

    // Dio Consumer
    sl.registerLazySingleton<DioConsumer>(() => DioConsumer(client: sl<Dio>()));

    sl.registerLazySingleton(() => Dio());
    // Custom and Log Interceptors
    sl.registerLazySingleton(() => CustomInterceptors());
    sl.registerLazySingleton(
      () => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }
}
