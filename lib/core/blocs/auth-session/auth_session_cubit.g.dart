// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_session_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSessionState _$AuthSessionStateFromJson(Map<String, dynamic> json) =>
    AuthSessionState(
      status: $enumDecodeNullable(_$AuthStatusEnumMap, json['status']) ??
          AuthStatus.unauthenticated,
    );

Map<String, dynamic> _$AuthSessionStateToJson(AuthSessionState instance) =>
    <String, dynamic>{
      'status': _$AuthStatusEnumMap[instance.status]!,
    };

const _$AuthStatusEnumMap = {
  AuthStatus.authenticated: 'authenticated',
  AuthStatus.unauthenticated: 'unauthenticated',
  AuthStatus.expired: 'expired',
};
