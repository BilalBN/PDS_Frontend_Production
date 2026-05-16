import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:isar_community/isar.dart';
import 'package:mqtt5_client/mqtt5_server_client.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pds_2/chopper/client/chopper_client.dart';
import 'package:pds_2/core/configs/routes.dart';
import 'package:pds_2/core/globals/keys.dart';
import 'package:pds_2/core/services/mqtt_client.dart';
import 'package:pds_2/core/services/service_initializer.dart';
import 'package:pds_2/core/services/service_locator.dart';
import 'package:pds_2/isar/collections/isar_user_collection.dart';
import 'package:pds_2/shared/local_database/isar_local_database.dart';
import 'package:pds_2/shared/local_database/local_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize isar
  final docDir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([
    IsarUserCollectionSchema,
  ], directory: docDir.path);
  serviceLocator.registerSingleton<LocalDatabase>(IsarLocalDatabase(isar));

  // Initialize Hydrated Bloc
  final tempDir = await getTemporaryDirectory();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(tempDir.path),
  );

  runApp(const PDSWidget());
}

class PDSWidget extends StatefulWidget {
  const PDSWidget({super.key});

  @override
  State<PDSWidget> createState() => _PDSWidgetState();
}

class _PDSWidgetState extends State<PDSWidget> {
  @override
  void initState() {
    super.initState();
    // Initialize Network clients client
    serviceLocator.registerSingleton<ChopperClient>(chopperClient);
    serviceLocator.registerSingleton<MqttServerClient>(mqttClient);
    // Initialize all dependencies
    serviceInitializer();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      scaffoldMessengerKey: scaffoldState,
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
