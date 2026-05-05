import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pds_2/core/configs/routes.dart';
import 'package:pds_2/core/network/http/rest_client.dart';
import 'package:pds_2/core/network/http/rest_client_impl.dart';
import 'package:pds_2/core/services/service_initalizer.dart';
import 'package:pds_2/core/services/service_locator.dart';
import 'package:pds_2/hive/constants/hive_boxes.dart';
import 'package:pds_2/hive/hive_registrar.g.dart';
import 'package:pds_2/hive/models/user_type.dart';
import 'package:pds_2/shared/local_storage/hive_local_storage.dart';
import 'package:pds_2/shared/local_storage/hydrated_local_storage.dart';
import 'package:pds_2/shared/local_storage/local_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapters();

  // Open required boxes
  await Future.wait([
    Hive.openBox(HiveBoxes.pds),
    Hive.openBox<UserType>(HiveBoxes.pdsUser),
  ]);
  final hiveBox = Hive.box('PDS');
  serviceLocator.registerSingleton<LocalStorage>(HiveLocalStorage(hiveBox));

  // Initialize Hydrated Bloc
  final hydratedBox = await Hive.openBox(HiveBoxes.pdsHydrated);
  HydratedBloc.storage = HydratedLocalStorage(hydratedBox);

  // Initialize HTTP client
  serviceLocator.registerFactory<RestClient>(() => IRestClient());

  // Initialize all dependencies
  serviceInitializer();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const PDSWidget());
}

class PDSWidget extends StatefulWidget {
  const PDSWidget({super.key});

  @override
  State<PDSWidget> createState() => _PDSWidgetState();
}

class _PDSWidgetState extends State<PDSWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        appBarTheme: const AppBarThemeData(backgroundColor: Colors.white),
        colorScheme: ColorScheme.light(
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          primary: const Color.fromARGB(255, 61, 126, 240),
          secondary: Colors.green,
          surface: Colors.grey[50]!,
        ),
        fontFamily: 'Ubuntu',
        inputDecorationTheme: InputDecorationThemeData(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.grey[200]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.grey[200]!),
          ),
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.grey[200]!),
          ),
          hintStyle: TextStyle(color: Colors.grey[700]),
          prefixIconColor: Colors.grey[700],
        ),
      ),
    );
  }
}
