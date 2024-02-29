import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poloniex_app/features/login/login_page.dart';
import 'package:poloniex_app/features/price-info/price_chart_page.dart';
import 'package:poloniex_app/features/price-info/price_ticker_page.dart';
import 'package:poloniex_app/features/register/register_page.dart';

part 'app_router.g.dart';

@TypedGoRoute<LoginRoute>(path: LoginPage.route)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LoginPage();
}

@TypedGoRoute<RegisterRoute>(path: RegisterPage.route)
class RegisterRoute extends GoRouteData {
  const RegisterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const RegisterPage();
}

@TypedGoRoute<PriceTickerRoute>(path: PriceTickerPage.route)
class PriceTickerRoute extends GoRouteData {
  const PriceTickerRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const PriceTickerPage();
}

@TypedGoRoute<PriceChartRoute>(path: PriceChartPage.route)
class PriceChartRoute extends GoRouteData {
  const PriceChartRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const PriceChartPage();
}
