import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poloniex_app/core/models/price_ticker_model.dart';
import 'package:poloniex_app/core/repositories/price_repository.dart';
import 'package:poloniex_app/core/utils/enums.dart';
import 'package:web_socket_client/web_socket_client.dart';

part 'price_info_state.dart';

class PriceInfoCubit extends Cubit<PriceInfoState> {
  final PriceRepository priceRepo;
  String? socketId;
  WebSocket? socket;
  StreamSubscription? socketStream;
  Timer? socketPingTimer;
  int socketPingTimerCount = 15;

  PriceInfoCubit({
    required this.priceRepo,
  }) : super(
          PriceInfoState(),
        );

  void updateState({
    int? inputtedPrice,
  }) {
    emit(state.update(inputtedPrice: inputtedPrice));
  }

  void reset() {
    socketId = null;

    socket?.close();
    socket = null;

    socketStream?.cancel();
    socketStream = null;

    socketPingTimer?.cancel;
    socketPingTimer = null;
    socketPingTimerCount = 15;

    emit(PriceInfoState());
  }

  void startSocketPingTimer() {
    socketPingTimerCount = 15;
    socketPingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (socketPingTimerCount == 0) {
        socketPingTimer?.cancel();
        socket?.send(json.encode({"id": socketId!, "type": "ping"}));
        startSocketPingTimer();
        return;
      }

      socketPingTimerCount--;
    });
  }

  void addSocketStreamHandler() {
    socketStream = socket?.messages.listen((message) {
      final msg = json.decode(message);

      if (msg?['type'] == 'welcome' && socketId == null) {
        socketId = msg?['id'];
        subscribePriceTicker();
      }

      if (msg?['subject'] == 'ticker') {
        final ticker = PriceTickerModel.fromJson(msg!['data']);
        emit(
          state.update(
            priceTickers: [...state.priceTickers, ticker],
          ),
        );
      }
    });
  }

  void subscribePriceTicker() {
    socket?.send(json.encode({
      // "id": "${socketId!}-${DateTime.now().toUtc().millisecondsSinceEpoch}",
      "id": socketId!,
      "type": "subscribe",
      "topic": "/contractMarket/ticker:BTCUSDTPERP",
      "response": true
    }));
  }

  Future<void> fetchSocketTokenAndInit() async {
    try {
      emit(state.update(fetchWebsocketTokenState: RequestState.loading));
      final token = await priceRepo.fetchPoloniexWebsocketToken();

      if (token == null) {
        emit(
          state.update(
            fetchWebsocketTokenState: RequestState.failure,
            errMsg: 'Couldn\t get websocket token',
          ),
        );
      }

      emit(state.update(fetchWebsocketTokenState: RequestState.success));

      final uri = Uri.parse(
          'wss://futures-apiws.poloniex.com/endpoint?token=$token&acceptUserMessage=true');
      socket = WebSocket(uri);

      addSocketStreamHandler();
      startSocketPingTimer();
    } catch (e) {
      emit(
        state.update(
          fetchWebsocketTokenState: RequestState.failure,
          errMsg: 'Unexpected error',
        ),
      );
    }
  }
}
