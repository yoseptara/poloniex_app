// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_ticker_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PriceTickerModel _$PriceTickerModelFromJson(Map<String, dynamic> json) {
  return _PriceTickerModel.fromJson(json);
}

/// @nodoc
mixin _$PriceTickerModel {
  String get symbol => throw _privateConstructorUsedError;
  int? get sequence => throw _privateConstructorUsedError;
  String? get side => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  String? get tradeId =>
      throw _privateConstructorUsedError; // int? bestBidSize,
// int? bestBidPrice,
// int? bestAskPrice,
// int? bestAskSize,
  @DateTimeFromJsonConverter()
  @JsonKey(name: 'ts')
  DateTime get filledDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceTickerModelCopyWith<PriceTickerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceTickerModelCopyWith<$Res> {
  factory $PriceTickerModelCopyWith(
          PriceTickerModel value, $Res Function(PriceTickerModel) then) =
      _$PriceTickerModelCopyWithImpl<$Res, PriceTickerModel>;
  @useResult
  $Res call(
      {String symbol,
      int? sequence,
      String? side,
      double price,
      int? size,
      String? tradeId,
      @DateTimeFromJsonConverter()
      @JsonKey(name: 'ts')
      DateTime filledDateTime});
}

/// @nodoc
class _$PriceTickerModelCopyWithImpl<$Res, $Val extends PriceTickerModel>
    implements $PriceTickerModelCopyWith<$Res> {
  _$PriceTickerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? sequence = freezed,
    Object? side = freezed,
    Object? price = null,
    Object? size = freezed,
    Object? tradeId = freezed,
    Object? filledDateTime = null,
  }) {
    return _then(_value.copyWith(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: freezed == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int?,
      side: freezed == side
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      tradeId: freezed == tradeId
          ? _value.tradeId
          : tradeId // ignore: cast_nullable_to_non_nullable
              as String?,
      filledDateTime: null == filledDateTime
          ? _value.filledDateTime
          : filledDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceTickerModelImplCopyWith<$Res>
    implements $PriceTickerModelCopyWith<$Res> {
  factory _$$PriceTickerModelImplCopyWith(_$PriceTickerModelImpl value,
          $Res Function(_$PriceTickerModelImpl) then) =
      __$$PriceTickerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String symbol,
      int? sequence,
      String? side,
      double price,
      int? size,
      String? tradeId,
      @DateTimeFromJsonConverter()
      @JsonKey(name: 'ts')
      DateTime filledDateTime});
}

/// @nodoc
class __$$PriceTickerModelImplCopyWithImpl<$Res>
    extends _$PriceTickerModelCopyWithImpl<$Res, _$PriceTickerModelImpl>
    implements _$$PriceTickerModelImplCopyWith<$Res> {
  __$$PriceTickerModelImplCopyWithImpl(_$PriceTickerModelImpl _value,
      $Res Function(_$PriceTickerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? sequence = freezed,
    Object? side = freezed,
    Object? price = null,
    Object? size = freezed,
    Object? tradeId = freezed,
    Object? filledDateTime = null,
  }) {
    return _then(_$PriceTickerModelImpl(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: freezed == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int?,
      side: freezed == side
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      tradeId: freezed == tradeId
          ? _value.tradeId
          : tradeId // ignore: cast_nullable_to_non_nullable
              as String?,
      filledDateTime: null == filledDateTime
          ? _value.filledDateTime
          : filledDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceTickerModelImpl implements _PriceTickerModel {
  const _$PriceTickerModelImpl(
      {required this.symbol,
      this.sequence,
      this.side,
      this.price = 0,
      this.size,
      this.tradeId,
      @DateTimeFromJsonConverter()
      @JsonKey(name: 'ts')
      required this.filledDateTime});

  factory _$PriceTickerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceTickerModelImplFromJson(json);

  @override
  final String symbol;
  @override
  final int? sequence;
  @override
  final String? side;
  @override
  @JsonKey()
  final double price;
  @override
  final int? size;
  @override
  final String? tradeId;
// int? bestBidSize,
// int? bestBidPrice,
// int? bestAskPrice,
// int? bestAskSize,
  @override
  @DateTimeFromJsonConverter()
  @JsonKey(name: 'ts')
  final DateTime filledDateTime;

  @override
  String toString() {
    return 'PriceTickerModel(symbol: $symbol, sequence: $sequence, side: $side, price: $price, size: $size, tradeId: $tradeId, filledDateTime: $filledDateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceTickerModelImpl &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.side, side) || other.side == side) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.tradeId, tradeId) || other.tradeId == tradeId) &&
            (identical(other.filledDateTime, filledDateTime) ||
                other.filledDateTime == filledDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, symbol, sequence, side, price,
      size, tradeId, filledDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceTickerModelImplCopyWith<_$PriceTickerModelImpl> get copyWith =>
      __$$PriceTickerModelImplCopyWithImpl<_$PriceTickerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceTickerModelImplToJson(
      this,
    );
  }
}

abstract class _PriceTickerModel implements PriceTickerModel {
  const factory _PriceTickerModel(
      {required final String symbol,
      final int? sequence,
      final String? side,
      final double price,
      final int? size,
      final String? tradeId,
      @DateTimeFromJsonConverter()
      @JsonKey(name: 'ts')
      required final DateTime filledDateTime}) = _$PriceTickerModelImpl;

  factory _PriceTickerModel.fromJson(Map<String, dynamic> json) =
      _$PriceTickerModelImpl.fromJson;

  @override
  String get symbol;
  @override
  int? get sequence;
  @override
  String? get side;
  @override
  double get price;
  @override
  int? get size;
  @override
  String? get tradeId;
  @override // int? bestBidSize,
// int? bestBidPrice,
// int? bestAskPrice,
// int? bestAskSize,
  @DateTimeFromJsonConverter()
  @JsonKey(name: 'ts')
  DateTime get filledDateTime;
  @override
  @JsonKey(ignore: true)
  _$$PriceTickerModelImplCopyWith<_$PriceTickerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
