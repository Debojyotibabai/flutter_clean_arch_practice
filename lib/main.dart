import 'package:clean_architecture_rivaan_ranawat/config/navigation/app_navigation.dart';
import 'package:clean_architecture_rivaan_ranawat/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/presentation/bloc/food_category/food_category_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/presentation/bloc/recommendation/recommendation_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/presentation/bloc/report_recommendation/report_recommendation_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/presentation/bloc/edit_profile/edit_profile_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/presentation/bloc/edit_profile_data/edit_profile_data_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/bloc/delete_group/delete_group_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/bloc/get_all_group/get_all_group_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/bloc/get_foods_as_per_restaurants/get_food_as_per_restaurants_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/bloc/get_group_details/get_group_details_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/bloc/get_group_participants/get_group_participants_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/bloc/get_group_recommendations/get_group_recommendations_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/bloc/update_group_details/update_group_details_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/presentation/bloc/particular_restaurant_foods/particular_restaurant_foods_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/presentation/bloc/recommendation_details/recommendation_details_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initiDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<AuthenticationBloc>()),
        BlocProvider(create: (_) => serviceLocator<LoginBloc>()),
        BlocProvider(create: (_) => serviceLocator<FoodCategoryBloc>()),
        BlocProvider(create: (_) => serviceLocator<RecommendationBloc>()),
        BlocProvider(create: (_) => serviceLocator<ReportRecommendationBloc>()),
        BlocProvider(
            create: (_) => serviceLocator<RecommendationDetailsBloc>()),
        BlocProvider(
            create: (_) => serviceLocator<ParticularRestaurantFoodsBloc>()),
        BlocProvider(create: (_) => serviceLocator<EditProfileDataBloc>()),
        BlocProvider(create: (_) => serviceLocator<EditProfileBloc>()),
        BlocProvider(create: (_) => serviceLocator<GetAllGroupBloc>()),
        BlocProvider(create: (_) => serviceLocator<GetGroupDetailsBloc>()),
        BlocProvider(create: (_) => serviceLocator<UpdateGroupDetailsBloc>()),
        BlocProvider(
            create: (_) => serviceLocator<GetGroupRecommendationsBloc>()),
        BlocProvider(create: (_) => serviceLocator<DeleteGroupBloc>()),
        BlocProvider(
            create: (_) => serviceLocator<GetFoodAsPerRestaurantsBloc>()),
        BlocProvider(create: (_) => serviceLocator<GetGroupParticipantsBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthenticationBloc>().add(AppStartedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Recommenu",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      routerConfig: AppNavigation().appRoute,
    );
  }
}
