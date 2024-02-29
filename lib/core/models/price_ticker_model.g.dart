// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_ticker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriceTickerModelImpl _$$PriceTickerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PriceTickerModelImpl(
      symbol: json['symbol'] as String,
      sequence: json['sequence'] as int?,
      side: json['side'] as String?,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      size: json['size'] as int?,
      tradeId: json['tradeId'] as String?,
      filledDateTime: const DateTimeFromJsonConverter().fromJson(json['ts']),
    );

Map<String, dynamic> _$$PriceTickerModelImplToJson(
        _$PriceTickerModelImpl instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'sequence': instance.sequence,
      'side': instance.side,
      'price': instance.price,
      'size': instance.size,
      'tradeId': instance.tradeId,
      'ts': const DateTimeFromJsonConverter().toJson(instance.filledDateTime),
    };
