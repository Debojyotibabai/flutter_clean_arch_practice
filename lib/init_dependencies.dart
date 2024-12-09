import 'package:clean_architecture_rivaan_ranawat/features/auth/data/data_sources/auth_data_source.dart';
import 'package:clean_architecture_rivaan_ranawat/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:clean_architecture_rivaan_ranawat/features/auth/domain/repositories/auth_repository.dart';
import 'package:clean_architecture_rivaan_ranawat/features/auth/domain/use_cases/login_use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/data/data_sources/food_category_data_source.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/data/data_sources/recommendation_data_source.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/data/repositories/food_category_repository_impl.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/data/repositories/recommendation_repository_impl.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/repositories/food_category_repository.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/repositories/recommendation_repository.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/use_cases/get_food_category_use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/use_cases/get_recommedation_use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/use_cases/report_recommended_food_use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/presentation/bloc/food_category/food_category_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/presentation/bloc/recommendation/recommendation_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/presentation/bloc/report_recommendation/report_recommendation_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/data/data_sources/recommendation_details_data_source.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/data/repositories/recommendation_details_repository_impl.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/domain/repositories/recommendation_details_repository.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/domain/use_cases/get_all_foods_for_particular_restaurant.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/domain/use_cases/get_recommendation_details_use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/presentation/bloc/particular_restaurant_foods/particular_restaurant_foods_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/presentation/bloc/recommendation_details/recommendation_details_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

void initiDependencies() {
  _initAuthenticationDependencies();
  _initLoginDependencies();
  _initFoodCategoryDependencies();
  _initRecommendationDependencies();
  _initRecommendationDetailsAndGetParticularRestaurantAllFoodDependencies();
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

void _initRecommendationDependencies() {
  serviceLocator
    ..registerFactory<RecommendationDataSource>(
      () => RecommendationDataSourceImpl(),
    )
    ..registerFactory<RecommendationRepository>(
      () => RecommendationRepositoryImpl(
          recommendationDataSourceImpl: serviceLocator()),
    )
    ..registerFactory(
      () => GetRecommedationUseCase(
          recommendationRepositoryImpl: serviceLocator()),
    )
    ..registerLazySingleton(
      () => RecommendationBloc(getRecommedationUseCase: serviceLocator()),
    )
    ..registerFactory(
      () => ReportRecommendedFoodUseCase(
          recommendationRepositoryImpl: serviceLocator()),
    )
    ..registerLazySingleton(
      () => ReportRecommendationBloc(
          reportRecommendedFoodUseCase: serviceLocator()),
    );
}

void _initRecommendationDetailsAndGetParticularRestaurantAllFoodDependencies() {
  serviceLocator
    ..registerFactory<RecommendationDetailsDataSource>(
      () => RecommendationDetailsDataSourceImpl(),
    )
    ..registerFactory<RecommendationDetailsRepository>(
      () => RecommendationDetailsRepositoryImpl(
          recommendationDetailsDataSourceImpl: serviceLocator()),
    )
    ..registerFactory(
      () => GetRecommendationDetailsUseCase(
          recommendationDetailsRepositoryImpl: serviceLocator()),
    )
    ..registerLazySingleton(
      () => RecommendationDetailsBloc(
          getRecommendationDetailsUseCase: serviceLocator()),
    )
    ..registerFactory(
      () => GetAllFoodsForParticularRestaurantUseCase(
          recommendationDetailsRepositoryImpl: serviceLocator()),
    )
    ..registerLazySingleton(
      () => ParticularRestaurantFoodsBloc(
          getAllFoodsForParticularRestaurantUseCase: serviceLocator()),
    );
}
