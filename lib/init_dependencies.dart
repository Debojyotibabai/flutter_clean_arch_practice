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
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/data/data_sources/edit_profile_data_source.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/data/repositories/edit_profile_repository_impl.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/domain/repositories/edit_profile_repository.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/domain/use_cases/edit_profile_use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/domain/use_cases/get_edit_profile_data_use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/presentation/bloc/edit_profile/edit_profile_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/presentation/bloc/edit_profile_data/edit_profile_data_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/data/data_sources/group_data_source.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/data/repositories/group_repository_impl.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/repositories/group_repository.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/use_cases/get_all_groups_use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/use_cases/get_group_details_use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/use_cases/get_group_recommendations_use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/use_cases/update_group_details_use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/bloc/get_all_group/get_all_group_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/bloc/get_group_details/get_group_details_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/bloc/get_group_recommendations/get_group_recommendations_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/bloc/update_group_details/update_group_details_bloc.dart';
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
  _editProfileDependencies();
  _initGroupDependencies();
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

void _editProfileDependencies() {
  serviceLocator
    ..registerFactory<EditProfileDataSource>(
      () => EditProfileDataSourceImpl(),
    )
    ..registerFactory<EditProfileRepository>(
      () => EditProfileRepositoryImpl(
          editProfileDataSourceImpl: serviceLocator()),
    )
    ..registerFactory(
      () => GetEditProfileDataUseCase(
          editProfileRepositoryImpl: serviceLocator()),
    )
    ..registerLazySingleton(
      () => EditProfileDataBloc(getEditProfileDataUseCase: serviceLocator()),
    )
    ..registerFactory(
      () => EditProfileUseCase(editProfileRepositoryImpl: serviceLocator()),
    )
    ..registerLazySingleton(
      () => EditProfileBloc(editProfileUseCase: serviceLocator()),
    );
}

void _initGroupDependencies() {
  serviceLocator
    ..registerLazySingleton(
      () => GetAllGroupBloc(getAllGroupsUseCase: serviceLocator()),
    )
    ..registerFactory(
      () => GetAllGroupsUseCase(groupRepositoryImpl: serviceLocator()),
    )
    ..registerFactory<GroupRepository>(
      () => GroupRepositoryImpl(groupDataSourceImpl: serviceLocator()),
    )
    ..registerFactory<GroupDataSource>(
      () => GroupDataSourceImpl(),
    )
    ..registerLazySingleton(
      () => GetGroupDetailsBloc(getGroupDetailsUseCase: serviceLocator()),
    )
    ..registerFactory(
      () => GetGroupDetailsUseCase(groupRepositoryImpl: serviceLocator()),
    )
    ..registerLazySingleton(
      () => UpdateGroupDetailsBloc(updateGroupDetailsUseCase: serviceLocator()),
    )
    ..registerFactory(
      () => UpdateGroupDetailsUseCase(groupRepositoryImpl: serviceLocator()),
    )
    ..registerLazySingleton(
      () => GetGroupRecommendationsBloc(
          getGroupRecommendationsUseCase: serviceLocator()),
    )
    ..registerFactory(
      () =>
          GetGroupRecommendationsUseCase(groupRepositoryImpl: serviceLocator()),
    );
}
