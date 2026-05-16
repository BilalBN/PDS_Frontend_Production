import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pds_2/core/services/service_locator.dart';
import 'package:pds_2/features/account/bloc/cubit/get_account_cubit.dart';
import 'package:pds_2/features/account/data/repository/account_repository.dart';
import 'package:pds_2/features/auth/bloc/user_login_cubit/user_login_cubit.dart';
import 'package:pds_2/features/auth/data/repository/auth_repository.dart';
import 'package:pds_2/features/auth/presentation/providers/auth_controllers_provider.dart';
import 'package:pds_2/features/batch/bloc/listen_active_batches_bloc/listen_active_batches_bloc.dart';
import 'package:pds_2/features/batch/bloc/listen_delete_batches_bloc/listen_delete_batches_bloc.dart';
import 'package:pds_2/features/batch/data/repository/batch_realtime_repository.dart';
import 'package:pds_2/features/batch/presentation/providers/batches_provider.dart';
import 'package:pds_2/pages/account_page_widget.dart';
import 'package:pds_2/pages/batch_main_steps_page_widget.dart';
import 'package:pds_2/pages/batch_sub_steps_page_widget.dart';
import 'package:pds_2/pages/login_page_widget.dart';
import 'package:pds_2/pages/main_page_widget.dart';
import 'package:pds_2/shared/constants/nav_routes.dart';
import 'package:pds_2/shared/local_database/local_database.dart';
import 'package:provider/provider.dart';

GoRouter _router = GoRouter(
  initialLocation: NavRoutes.loginPage,
  redirect: (context, state) {
    final currentRoute = state.uri.path;
    final publicRoutes = {NavRoutes.loginPage};
    bool isUserLoggedIn = serviceLocator<LocalDatabase>().isUserLoggedIn();

    if (!isUserLoggedIn && !publicRoutes.contains(currentRoute)) {
      return NavRoutes.loginPage;
    } else if (isUserLoggedIn && publicRoutes.contains(currentRoute)) {
      return NavRoutes.mainPage;
    }
    return null;
  },
  routes: [
    GoRoute(
      path: NavRoutes.accountPage,
      builder: (context, state) => MultiProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                GetAccountCubit(serviceLocator<AccountRepository>()),
          ),
        ],
        child: const AccountPageWidget(),
      ),
    ),
    GoRoute(
      path: NavRoutes.batchMainStepsPage,
      builder: (context, state) => const BatchMainStepsPageWidget(),
    ),
    GoRoute(
      path: NavRoutes.batchSubStepsPage,
      builder: (context, state) => const BatchSubStepsPageWidget(),
    ),
    GoRoute(
      path: NavRoutes.loginPage,
      builder: (context, state) => MultiProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                UserLoginCubit(serviceLocator<AuthRepository>()),
          ),
          ChangeNotifierProvider(
            create: (context) => AuthControllersProvider(),
          ),
        ],
        child: const LoginPageWidget(),
      ),
    ),
    GoRoute(
      path: NavRoutes.mainPage,
      builder: (context, state) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => BatchesProvider()),
          BlocProvider(
            create: (context) => ListenActiveBatchesBloc(
              serviceLocator<BatchRealtimeRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => ListenDeleteBatchesBloc(
              serviceLocator<BatchRealtimeRepository>(),
            ),
          ),
        ],
        child: const MainPageWidget(),
      ),
    ),
  ],
);

GoRouter get router => _router;
