import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pds_2/core/services/service_locator.dart';
import 'package:pds_2/features/account/bloc/cubit/get_account_cubit.dart';
import 'package:pds_2/features/account/data/repository/account_repository.dart';
import 'package:pds_2/features/auth/bloc/user_login_cubit/user_login_cubit.dart';
import 'package:pds_2/features/auth/data/repository/auth_repository.dart';
import 'package:pds_2/features/auth/presentation/providers/auth_controllers_provider.dart';
import 'package:pds_2/pages/account_page_widget.dart';
import 'package:pds_2/pages/login_page_widget.dart';
import 'package:pds_2/pages/main_page_widget.dart';
import 'package:pds_2/shared/constants/nav_routes.dart';
import 'package:provider/provider.dart';

GoRouter _router = GoRouter(
  initialLocation: NavRoutes.mainPage,
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
      builder: (context, state) => const MainPageWidget(),
    ),
  ],
);

GoRouter get router => _router;
