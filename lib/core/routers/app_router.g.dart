// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $loginRoute,
      $registerRoute,
      $priceTickerRoute,
      $priceChartRoute,
    ];

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login_page',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/login_page',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registerRoute => GoRouteData.$route(
      path: '/register_page',
      factory: $RegisterRouteExtension._fromState,
    );

extension $RegisterRouteExtension on RegisterRoute {
  static RegisterRoute _fromState(GoRouterState state) => const RegisterRoute();

  String get location => GoRouteData.$location(
        '/register_page',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $priceTickerRoute => GoRouteData.$route(
      path: '/price_ticker_page',
      factory: $PriceTickerRouteExtension._fromState,
    );

extension $PriceTickerRouteExtension on PriceTickerRoute {
  static PriceTickerRoute _fromState(GoRouterState state) =>
      const PriceTickerRoute();

  String get location => GoRouteData.$location(
        '/price_ticker_page',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $priceChartRoute => GoRouteData.$route(
      path: '/price_chart_page',
      factory: $PriceChartRouteExtension._fromState,
    );

extension $PriceChartRouteExtension on PriceChartRoute {
  static PriceChartRoute _fromState(GoRouterState state) =>
      const PriceChartRoute();

  String get location => GoRouteData.$location(
        '/price_chart_page',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
