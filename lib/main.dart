import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:poloniex_app/app.dart';
import 'package:poloniex_app/core/blocs/auth-session/auth_session_cubit.dart';
import 'package:poloniex_app/core/routers/app_router.dart';
import 'package:poloniex_app/core/services/firebase_service.dart';
import 'package:poloniex_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait(
    [
      HydratedStorage.build(
        storageDirectory: kIsWeb
            ? HydratedStorage.webStorageDirectory
            : await getTemporaryDirectory(),
      ).then((value) => HydratedBloc.storage = value),
      Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
    ],
  );

  final firebaseService = FirebaseService();
  final authSessionCubit = AuthSessionCubit();

  final router = GoRouter(
      routes: $appRoutes,
      initialLocation: authSessionCubit.state.status == AuthStatus.authenticated
          ? const PriceTickerRoute().location
          : const LoginRoute().location);

  runApp(
    PoloniexApp(
      firebaseService: firebaseService,
      authSessionCubit: authSessionCubit,
      router: router,
    ),
  );
}
