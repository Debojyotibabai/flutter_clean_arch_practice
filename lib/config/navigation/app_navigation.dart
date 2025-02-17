import 'package:clean_architecture_rivaan_ranawat/config/navigation/go_router_refresh_stream.dart';
import 'package:clean_architecture_rivaan_ranawat/config/navigation/routes.dart';
import 'package:clean_architecture_rivaan_ranawat/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/auth/presentation/pages/login_page.dart';
import 'package:clean_architecture_rivaan_ranawat/features/auth/presentation/pages/signup_page.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/presentation/pages/edit_profile_page.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/pages/group_details_page.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/pages/group_listing_page.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/pages/group_participants_page.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/presentation/pages/recommendation_details_page.dart';
import 'package:clean_architecture_rivaan_ranawat/init_dependencies.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  final GoRouter appRoute = GoRouter(
    refreshListenable:
        GoRouterRefreshStream(serviceLocator<AuthenticationBloc>().stream),
    redirect: (context, state) {
      if (serviceLocator<AuthenticationBloc>().state is AuthenticationSuccess) {
        // User is logged in...
        // Redirect to the homepage if they're on the login screen
        if (state.fullPath == '/login') return '/';

        // Otherwise no further redirect needed
        return null;
      }

      // Not logged in, if already on the login page then no need to redirect
      if (state.fullPath == '/login') return null;

      // otherwise redirect them to the login page
      return '/login';
    },
    // initialLocation: "/groupListing/groupParticipants",
    routes: [
      GoRoute(
        path: "/login",
        name: Routes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: "/signup",
        name: Routes.signup,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: "/",
        name: Routes.dashboard,
        builder: (context, state) => const DashboardScreen(),
        routes: [
          GoRoute(
            path: "recommendationDetails/:restaurantAddressId",
            name: Routes.recommendationDetails,
            builder: (context, state) => RecommendationDetailsScreen(
              restaurantAddressId: state.pathParameters['restaurantAddressId']!,
              restaurantId: state.extra! as String,
            ),
          ),
        ],
      ),
      GoRoute(
        path: "/editProfile",
        name: Routes.editProfile,
        builder: (context, state) => const EditProfile(),
      ),
      GoRoute(
        path: "/groupListing",
        name: Routes.groupListing,
        builder: (context, state) => const GroupListingPage(),
        routes: [
          GoRoute(
            path: "groupDetails/:groupId",
            name: Routes.groupDetails,
            builder: (context, state) => GroupDetailsPage(
              groupId: state.pathParameters["groupId"]!,
            ),
          ),
          GoRoute(
            path: "groupParticipants/:groupId",
            name: Routes.groupParticipants,
            builder: (context, state) => GroupParticipantsPage(
              groupId: state.pathParameters["groupId"]!,
            ),
          ),
        ],
      )
    ],
  );
}
