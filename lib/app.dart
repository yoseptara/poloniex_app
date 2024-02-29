import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:poloniex_app/core/blocs/auth-session/auth_session_cubit.dart';
import 'package:poloniex_app/core/blocs/price-info/price_info_cubit.dart';
import 'package:poloniex_app/core/repositories/auth_repository.dart';
import 'package:poloniex_app/core/repositories/price_repository.dart';
import 'package:poloniex_app/core/routers/app_router.dart';
import 'package:poloniex_app/core/services/firebase_service.dart';

class PoloniexApp extends StatelessWidget {
  final FirebaseService firebaseService;
  final AuthSessionCubit authSessionCubit;
  final GoRouter router;

  const PoloniexApp({
    super.key,
    required this.firebaseService,
    required this.authSessionCubit,
    required this.router,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => AuthRepository(firebaseService),
        ),
        RepositoryProvider(
          create: (_) => PriceRepository(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => AuthSessionCubit(),
              ),
              BlocProvider(
                create: (_) => PriceInfoCubit(
                  priceRepo: context.read<PriceRepository>(),
                ),
              ),
            ],
            child: BlocListener<AuthSessionCubit, AuthSessionState>(
              listenWhen: (previous, current) => previous.status != current.status,
              listener: (context, state) {
                debugPrint(
                    '(MyApp, BlocListener) executed with status : ${state.status.name}');
                if (state.status == AuthStatus.authenticated) {
                  router.go(const PriceTickerRoute().location);
                }

                if (state.status == AuthStatus.unauthenticated) {
                  router.go(const LoginRoute().location);
                }
              },
              child: Listener(
                onPointerDown: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: MaterialApp.router(
                  title: 'Poloniex App',
                  theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                    useMaterial3: true,
                  ),
                  routerConfig: router,
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
