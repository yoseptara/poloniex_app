part of 'price_info_cubit.dart';

class PriceInfoState {
  final RequestState fetchWebsocketTokenState;
  final List<PriceTickerModel> priceTickers;
  final int? inputtedPrice;
  final bool showProgressLoader;
  final bool dismissProgressLoader;
  final String? errMsg;
  final Function? errorRetryFunc;


  PriceInfoState({
    this.fetchWebsocketTokenState = RequestState.loading,
    this.priceTickers = const [],
    this.inputtedPrice,
    this.showProgressLoader = false,
    this.dismissProgressLoader = false,
    this.errMsg,
    this.errorRetryFunc,
  });

    // factory PriceInfoState.initial() {
  //   return PriceInfoState(
  //   );
  // }

  PriceInfoState update({
    RequestState? fetchWebsocketTokenState,
    List<PriceTickerModel>? priceTickers,
    int? inputtedPrice,
    bool? showProgressLoader,
    bool? dismissProgressLoader,
    String? errMsg,
    Function? errorRetryFunc,

  }) {
    return PriceInfoState(
      fetchWebsocketTokenState: fetchWebsocketTokenState ?? this.fetchWebsocketTokenState,
      priceTickers: priceTickers ?? this.priceTickers,
      inputtedPrice: inputtedPrice ?? this.inputtedPrice,
      showProgressLoader: showProgressLoader ?? false,
      dismissProgressLoader: dismissProgressLoader ?? false,
      errMsg: errMsg,
      errorRetryFunc: errorRetryFunc,
    );
  }
}