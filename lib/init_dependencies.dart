import 'package:clean_architecture_rivaan_ranawat/features/auth/data/data_sources/auth_data_source.dart';
import 'package:clean_architecture_rivaan_ranawat/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:clean_architecture_rivaan_ranawat/features/auth/domain/repositories/auth_repository.dart';
import 'package:clean_architecture_rivaan_ranawat/features/auth/domain/use_cases/login_use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/data/data_sources/food_category_data_source.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/data/repositories/food_category_repository_impl.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/repositories/food_category_repository.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/use_cases/get_food_category_use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/presentation/bloc/food_category/food_category_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

void initiDependencies() {
  _initAuthenticationDependencies();
  _initLoginDependencies();
  _initFoodCategoryDependencies();
}

void _initAuthenticationDependencies() {
  serviceLocator.registerLazySingleton(
    () => AuthenticationBloc(),
  );
}

void _initLoginDependencies() {
  serviceLocator
    ..registerFactory<AuthDataSource>(
      () => AuthDataSourceImpl(),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(authDataSourceImpl: serviceLocator()),
    )
    ..registerFactory(
      () => LoginUseCase(authRepositoryImpl: serviceLocator()),
    )
    ..registerLazySingleton(
      () => LoginBloc(loginUseCase: serviceLocator()),
    );
}

void _initFoodCategoryDependencies() {
  serviceLocator
    ..registerFactory<FoodCategoryDataSource>(
      () => FoodCategoryDataSourceImpl(),
    )
    ..registerFactory<FoodCategoryRepository>(
      () => FoodCategoryRepositoryImpl(
          foodCategoryDataSourceImpl: serviceLocator()),
    )
    ..registerFactory(
      () =>
          GetFoodCategoryUseCase(foodCategoryRepositoryImpl: serviceLocator()),
    )
    ..registerLazySingleton(
      () => FoodCategoryBloc(getFoodCategoryUseCase: serviceLocator()),
    );
}
