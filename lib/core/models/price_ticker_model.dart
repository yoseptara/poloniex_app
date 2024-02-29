import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poloniex_app/core/utils/json_converter.dart';

part 'price_ticker_model.freezed.dart';
part 'price_ticker_model.g.dart';

@freezed
class PriceTickerModel with _$PriceTickerModel {
  const factory PriceTickerModel({
    required String symbol,
    int? sequence,
    String? side,
   @Default(0) double price,
    int? size,
    String? tradeId,
    // int? bestBidSize,
    // int? bestBidPrice,
    // int? bestAskPrice,
    // int? bestAskSize,
    @DateTimeFromJsonConverter()
    @JsonKey(name: 'ts')
    required DateTime filledDateTime
}) = _PriceTickerModel;

  factory PriceTickerModel.fromJson(Map<String, dynamic> json) => _$PriceTickerModelFromJson(json);
 // Map<String, dynamic> toJson() => _$PriceTickerModelToJson(this);
}