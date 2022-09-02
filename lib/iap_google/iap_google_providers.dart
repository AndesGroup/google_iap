import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_iap/iap_google/iap_google_screen.dart';
import 'package:iap_interface/iap_interface.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import 'iap_google_state.dart';

final googleFakeData = [
  ProductDetails(
    id: 'consum1',
    title: 'consum1',
    description: 'consum1 des',
    price: '100.000 VND',
    rawPrice: 100000,
    currencyCode: 'VND',
  ),
  ProductDetails(
    id: 'consum2',
    title: 'consum2',
    description: 'consum2 des',
    price: '100.000 VND',
    rawPrice: 100000,
    currencyCode: 'VND',
  ),
  ProductDetails(
    id: 'sub2',
    title: 'sub2',
    description: 'sub2 des',
    price: '200.000 VND',
    rawPrice: 200000,
    currencyCode: 'VND',
  ),
];

class IAPGoogleNotifier extends IapNotifier {
  IAPGoogleNotifier(
    Ref ref, {
    List<String> consumableIds = const [
      'consum1',
      'consum2',
      'consum3',
      'consum4',
      'consum5',
      'consum6',
    ],
    List<String> subscriptionIds = const [
      'sub1',
      'sub2',
      'sub3',
      'sub4',
      'sub5',
    ],
    this.useFakeData = false,
  }) : super(ref, consumableIds: consumableIds, subscriptionIds: subscriptionIds);

  final bool useFakeData;
  InAppPurchase get _instance => InAppPurchase.instance;

  Set<String> get identifiers => {...state.consumableIds, ...state.subscriptionIds};

  bool _canInit = true;
  late StreamSubscription<List<PurchaseDetails>> _iapSubscription;

  void updateMessage(IapMessage message) {
    state = state.copyWith(message: message);
  }

  void updateIapItems(AsyncValue<List<ProductDetails>> iapItems) {
    ref.read(iapGoogleProvider.notifier).updateIapItems(iapItems);
  }

  void updatePurchaseResult(IapGooglePurchaseResult purchaseResult) {
    ref.read(iapGoogleProvider.notifier).updatePurchaseResult(purchaseResult);
  }

  @override
  Future<void> init() async {
    if (!_canInit) {
      return;
    }
    _iapSubscription = _instance.purchaseStream.listen(
      (purchaseDetailsList) {
        _listenToPurchaseUpdated(purchaseDetailsList);
      },
      onDone: () {
        _iapSubscription.cancel();
      },
      onError: (error) {
        updateMessage(IapMessage.from('Error: ${error.toString()}'));
      },
    );
    _instance.restorePurchases();
    _canInit = false;
  }

  @override
  Future<void> fetchProducts() async {
    updateIapItems(const AsyncLoading());

    final response = await _instance.queryProductDetails(identifiers);

    AsyncValue<List<ProductDetails>> iapItems;
    if (useFakeData) {
      iapItems = AsyncData(googleFakeData);
    } else {
      iapItems = AsyncData(response.productDetails);
    }

    updateIapItems(iapItems);

    state = state.copyWith(
        mustShowNoteSubscription: (iapItems.valueOrNull ?? [])
            .any((element) => state.subscriptionIds.contains(element.id)));
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) async {
    for (var purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        updatePurchaseResult(IapGooglePurchaseResult.from(purchaseDetails.status));
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          updatePurchaseResult(
              IapGooglePurchaseResult.from(purchaseDetails.status, purchaseDetails.error!));
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          state = state.copyWith(
              havePremium: state.subscriptionIds.contains(purchaseDetails.productID));
          updatePurchaseResult(IapGooglePurchaseResult.from(purchaseDetails.status));
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await InAppPurchase.instance.completePurchase(purchaseDetails);
        }
      }
    }
  }

  @override
  Future<void> makePurchase(String storeId) async {
    final items = (ref.read(iapGoogleProvider).iapItems.valueOrNull ?? [])
        .where((element) => element.id == storeId)
        .toList();
    if (items.isEmpty) {
      updateMessage(IapMessage.from('Product item not found! please try again.'));
      return;
    }
    final item = items.first;

    final PurchaseParam purchaseParam = PurchaseParam(productDetails: item);
    try {
      if (state.consumableIds.contains(item.id)) {
        await InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam);
      } else {
        await InAppPurchase.instance.buyNonConsumable(purchaseParam: purchaseParam);
      }
    } catch (e) {
      updateMessage(IapMessage.from(e));
    }
  }

  @override
  void dispose() {
    _iapSubscription.cancel();
    super.dispose();
  }

  @override
  Widget buyScreen({String title = 'Buy options'}) {
    return BuyScreen(title: title);
  }

  @override
  Future<bool> checkPurchase({String storeId = ''}) async {
    return state.havePremium;
  }
}

final iapGoogleProvider = StateNotifierProvider<IapProductsNotifierGoogle, IapGoogleState>((ref) {
  return IapProductsNotifierGoogle();
});

class IapProductsNotifierGoogle extends StateNotifier<IapGoogleState> {
  IapProductsNotifierGoogle() : super(const IapGoogleState());

  void updateIapItems(AsyncValue<List<ProductDetails>> iapItems) {
    state = state.copyWith(iapItems: iapItems);
  }

  void updatePurchaseResult(IapGooglePurchaseResult purchaseResult) {
    state = state.copyWith(purchaseResult: purchaseResult);
  }
}
