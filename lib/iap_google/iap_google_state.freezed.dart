// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'iap_google_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IapGoogleState {
  AsyncValue<List<ProductDetails>> get iapItems =>
      throw _privateConstructorUsedError;
  IapGooglePurchaseResult? get purchaseResult =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IapGoogleStateCopyWith<IapGoogleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IapGoogleStateCopyWith<$Res> {
  factory $IapGoogleStateCopyWith(
          IapGoogleState value, $Res Function(IapGoogleState) then) =
      _$IapGoogleStateCopyWithImpl<$Res>;
  $Res call(
      {AsyncValue<List<ProductDetails>> iapItems,
      IapGooglePurchaseResult? purchaseResult});

  $IapGooglePurchaseResultCopyWith<$Res>? get purchaseResult;
}

/// @nodoc
class _$IapGoogleStateCopyWithImpl<$Res>
    implements $IapGoogleStateCopyWith<$Res> {
  _$IapGoogleStateCopyWithImpl(this._value, this._then);

  final IapGoogleState _value;
  // ignore: unused_field
  final $Res Function(IapGoogleState) _then;

  @override
  $Res call({
    Object? iapItems = freezed,
    Object? purchaseResult = freezed,
  }) {
    return _then(_value.copyWith(
      iapItems: iapItems == freezed
          ? _value.iapItems
          : iapItems // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ProductDetails>>,
      purchaseResult: purchaseResult == freezed
          ? _value.purchaseResult
          : purchaseResult // ignore: cast_nullable_to_non_nullable
              as IapGooglePurchaseResult?,
    ));
  }

  @override
  $IapGooglePurchaseResultCopyWith<$Res>? get purchaseResult {
    if (_value.purchaseResult == null) {
      return null;
    }

    return $IapGooglePurchaseResultCopyWith<$Res>(_value.purchaseResult!,
        (value) {
      return _then(_value.copyWith(purchaseResult: value));
    });
  }
}

/// @nodoc
abstract class _$$_IapGoogleStateCopyWith<$Res>
    implements $IapGoogleStateCopyWith<$Res> {
  factory _$$_IapGoogleStateCopyWith(
          _$_IapGoogleState value, $Res Function(_$_IapGoogleState) then) =
      __$$_IapGoogleStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AsyncValue<List<ProductDetails>> iapItems,
      IapGooglePurchaseResult? purchaseResult});

  @override
  $IapGooglePurchaseResultCopyWith<$Res>? get purchaseResult;
}

/// @nodoc
class __$$_IapGoogleStateCopyWithImpl<$Res>
    extends _$IapGoogleStateCopyWithImpl<$Res>
    implements _$$_IapGoogleStateCopyWith<$Res> {
  __$$_IapGoogleStateCopyWithImpl(
      _$_IapGoogleState _value, $Res Function(_$_IapGoogleState) _then)
      : super(_value, (v) => _then(v as _$_IapGoogleState));

  @override
  _$_IapGoogleState get _value => super._value as _$_IapGoogleState;

  @override
  $Res call({
    Object? iapItems = freezed,
    Object? purchaseResult = freezed,
  }) {
    return _then(_$_IapGoogleState(
      iapItems: iapItems == freezed
          ? _value.iapItems
          : iapItems // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ProductDetails>>,
      purchaseResult: purchaseResult == freezed
          ? _value.purchaseResult
          : purchaseResult // ignore: cast_nullable_to_non_nullable
              as IapGooglePurchaseResult?,
    ));
  }
}

/// @nodoc

class _$_IapGoogleState
    with DiagnosticableTreeMixin
    implements _IapGoogleState {
  const _$_IapGoogleState(
      {this.iapItems = const AsyncLoading(), this.purchaseResult});

  @override
  @JsonKey()
  final AsyncValue<List<ProductDetails>> iapItems;
  @override
  final IapGooglePurchaseResult? purchaseResult;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IapGoogleState(iapItems: $iapItems, purchaseResult: $purchaseResult)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IapGoogleState'))
      ..add(DiagnosticsProperty('iapItems', iapItems))
      ..add(DiagnosticsProperty('purchaseResult', purchaseResult));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IapGoogleState &&
            const DeepCollectionEquality().equals(other.iapItems, iapItems) &&
            const DeepCollectionEquality()
                .equals(other.purchaseResult, purchaseResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(iapItems),
      const DeepCollectionEquality().hash(purchaseResult));

  @JsonKey(ignore: true)
  @override
  _$$_IapGoogleStateCopyWith<_$_IapGoogleState> get copyWith =>
      __$$_IapGoogleStateCopyWithImpl<_$_IapGoogleState>(this, _$identity);
}

abstract class _IapGoogleState implements IapGoogleState {
  const factory _IapGoogleState(
      {final AsyncValue<List<ProductDetails>> iapItems,
      final IapGooglePurchaseResult? purchaseResult}) = _$_IapGoogleState;

  @override
  AsyncValue<List<ProductDetails>> get iapItems;
  @override
  IapGooglePurchaseResult? get purchaseResult;
  @override
  @JsonKey(ignore: true)
  _$$_IapGoogleStateCopyWith<_$_IapGoogleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$IapGooglePurchaseResult {
  PurchaseStatus get status => throw _privateConstructorUsedError;
  IAPError? get error => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IapGooglePurchaseResultCopyWith<IapGooglePurchaseResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IapGooglePurchaseResultCopyWith<$Res> {
  factory $IapGooglePurchaseResultCopyWith(IapGooglePurchaseResult value,
          $Res Function(IapGooglePurchaseResult) then) =
      _$IapGooglePurchaseResultCopyWithImpl<$Res>;
  $Res call({PurchaseStatus status, IAPError? error, int time});
}

/// @nodoc
class _$IapGooglePurchaseResultCopyWithImpl<$Res>
    implements $IapGooglePurchaseResultCopyWith<$Res> {
  _$IapGooglePurchaseResultCopyWithImpl(this._value, this._then);

  final IapGooglePurchaseResult _value;
  // ignore: unused_field
  final $Res Function(IapGooglePurchaseResult) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? error = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseStatus,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as IAPError?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_IapGooglePurchaseResultCopyWith<$Res>
    implements $IapGooglePurchaseResultCopyWith<$Res> {
  factory _$$_IapGooglePurchaseResultCopyWith(_$_IapGooglePurchaseResult value,
          $Res Function(_$_IapGooglePurchaseResult) then) =
      __$$_IapGooglePurchaseResultCopyWithImpl<$Res>;
  @override
  $Res call({PurchaseStatus status, IAPError? error, int time});
}

/// @nodoc
class __$$_IapGooglePurchaseResultCopyWithImpl<$Res>
    extends _$IapGooglePurchaseResultCopyWithImpl<$Res>
    implements _$$_IapGooglePurchaseResultCopyWith<$Res> {
  __$$_IapGooglePurchaseResultCopyWithImpl(_$_IapGooglePurchaseResult _value,
      $Res Function(_$_IapGooglePurchaseResult) _then)
      : super(_value, (v) => _then(v as _$_IapGooglePurchaseResult));

  @override
  _$_IapGooglePurchaseResult get _value =>
      super._value as _$_IapGooglePurchaseResult;

  @override
  $Res call({
    Object? status = freezed,
    Object? error = freezed,
    Object? time = freezed,
  }) {
    return _then(_$_IapGooglePurchaseResult(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseStatus,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as IAPError?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_IapGooglePurchaseResult extends _IapGooglePurchaseResult
    with DiagnosticableTreeMixin {
  const _$_IapGooglePurchaseResult(
      {required this.status, this.error, required this.time})
      : super._();

  @override
  final PurchaseStatus status;
  @override
  final IAPError? error;
  @override
  final int time;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IapGooglePurchaseResult(status: $status, error: $error, time: $time)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IapGooglePurchaseResult'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('time', time));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IapGooglePurchaseResult &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.time, time));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(time));

  @JsonKey(ignore: true)
  @override
  _$$_IapGooglePurchaseResultCopyWith<_$_IapGooglePurchaseResult>
      get copyWith =>
          __$$_IapGooglePurchaseResultCopyWithImpl<_$_IapGooglePurchaseResult>(
              this, _$identity);
}

abstract class _IapGooglePurchaseResult extends IapGooglePurchaseResult {
  const factory _IapGooglePurchaseResult(
      {required final PurchaseStatus status,
      final IAPError? error,
      required final int time}) = _$_IapGooglePurchaseResult;
  const _IapGooglePurchaseResult._() : super._();

  @override
  PurchaseStatus get status;
  @override
  IAPError? get error;
  @override
  int get time;
  @override
  @JsonKey(ignore: true)
  _$$_IapGooglePurchaseResultCopyWith<_$_IapGooglePurchaseResult>
      get copyWith => throw _privateConstructorUsedError;
}
