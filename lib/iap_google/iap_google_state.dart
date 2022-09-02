import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

part 'iap_google_state.freezed.dart';

@freezed
class IapGoogleState with _$IapGoogleState {
  const factory IapGoogleState({
    @Default(AsyncLoading()) AsyncValue<List<ProductDetails>> iapItems,
    IapGooglePurchaseResult? purchaseResult,
  }) = _IapGoogleState;
}

@freezed
class IapGooglePurchaseResult with _$IapGooglePurchaseResult {
  const IapGooglePurchaseResult._();

  const factory IapGooglePurchaseResult({
    required PurchaseStatus status,
    IAPError? error,
    required int time,
  }) = _IapGooglePurchaseResult;

  bool isSuccess() {
    return status == PurchaseStatus.restored || status == PurchaseStatus.purchased;
  }

  factory IapGooglePurchaseResult.from(PurchaseStatus status, [IAPError? error]) {
    return IapGooglePurchaseResult(
        status: status, error: error, time: DateTime.now().millisecondsSinceEpoch);
  }
}
