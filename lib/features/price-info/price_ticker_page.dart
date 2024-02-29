import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poloniex_app/core/blocs/auth-session/auth_session_cubit.dart';
import 'package:poloniex_app/core/blocs/price-info/price_info_cubit.dart';
import 'package:poloniex_app/core/components/form_button.dart';
import 'package:poloniex_app/core/components/input_field.dart';
import 'package:poloniex_app/core/repositories/auth_repository.dart';
import 'package:poloniex_app/core/routers/app_router.dart';
import 'package:poloniex_app/core/utils/enums.dart';

class PriceTickerPage extends StatelessWidget {
  static const route = '/price_ticker_page';

  const PriceTickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _View(),
      ),
    );
  }
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  @override
  void initState() {
    context.read<PriceInfoCubit>().fetchSocketTokenAndInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceInfoCubit, PriceInfoState>(
        buildWhen: (previous, current) =>
            previous.fetchWebsocketTokenState !=
                current.fetchWebsocketTokenState ||
            previous.priceTickers != current.priceTickers ||
            previous.inputtedPrice != current.inputtedPrice,
        builder: (context, state) {
          if (state.fetchWebsocketTokenState == RequestState.loading ||
              state.priceTickers.isEmpty) {
            return const CircularProgressIndicator();
          }

          if (state.fetchWebsocketTokenState == RequestState.failure) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Failed to retrieve data'),
                const SizedBox(
                  height: 12,
                ),
                TextButton(
                  onPressed: () {
                    context.read<PriceInfoCubit>().fetchSocketTokenAndInit();
                  },
                  child: const Text('Retry'),
                ),
              ],
            );
          }

          // if (state.priceTickers == null) {
          //   return const Text('Please wait for a moment');
          // }

          final isHigher = (state.priceTickers.last.price ?? 0) >=
              (state.inputtedPrice ?? 0);
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      state.priceTickers.last.symbol,
                      style: TextStyle(
                        color: isHigher ? Colors.green : Colors.red,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      (state.inputtedPrice ??
                              state.priceTickers.last.price ??
                              0)
                          .toString(),
                      style: TextStyle(
                        color: isHigher ? Colors.green : Colors.red,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    if (isHigher)
                      const Icon(
                        Icons.arrow_drop_up,
                        size: 36,
                        color: Colors.green,
                      )
                    else
                      const Icon(
                        Icons.arrow_drop_down,
                        size: 36,
                        color: Colors.red,
                      ),
                    const SizedBox(
                      width: 12,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const _SetPrice(),
                const SizedBox(
                  height: 72,
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormButton(
                        text: 'Check Price Chart',
                        onPressed: () {
                          const PriceChartRoute().push(context);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: FormButton(
                        text: 'Logout',
                        onPressed: () async {
                          await context.read<AuthRepository>().signOut();
                          if (context.mounted) {
                            context.read<PriceInfoCubit>().reset();
                            context.read<AuthSessionCubit>().updateState(
                                  status: AuthStatus.unauthenticated,
                                );
                          }
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}

class _SetPrice extends StatelessWidget {
  const _SetPrice();

  @override
  Widget build(BuildContext context) {
    return InputField(
      labelText: 'Set price',
      onChanged: (value) {
        context.read<PriceInfoCubit>().updateState(
              inputtedPrice: int.tryParse(value),
            );
      },
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
    );
  }
}
