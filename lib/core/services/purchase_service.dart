import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:holiday_calendar/presentation/providers/premium_provider.dart';

/// UI state for the purchase flow (premium dialog).
enum PurchaseUiState { idle, loading, pending, error }

final purchaseUiStateProvider =
    StateProvider<PurchaseUiState>((ref) => PurchaseUiState.idle);

/// The "remove ads" product fetched from the store (for price display).
final removeAdsProductProvider = FutureProvider<ProductDetails?>((ref) async {
  final service = ref.watch(purchaseServiceProvider);
  return service.queryRemoveAdsProduct();
});

final purchaseServiceProvider = Provider<PurchaseService>((ref) {
  final service = PurchaseService(ref);
  ref.onDispose(service.dispose);
  return service;
});

/// One-time init hook — watch this once near the app root.
final purchaseServiceInitProvider = Provider<void>((ref) {
  ref.watch(purchaseServiceProvider).init();
});

/// Google Play in-app purchase for the one-time "remove ads" product.
/// On success, flips [PremiumStatus] which gates all ad widgets.
class PurchaseService {
  static const String removeAdsProductId = 'remove_ads';

  final Ref _ref;
  final InAppPurchase _iap = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  PurchaseService(this._ref);

  void init() {
    _subscription ??= _iap.purchaseStream.listen(
      _onPurchaseUpdates,
      onError: (Object e) => debugPrint('Purchase stream error: $e'),
    );
  }

  Future<ProductDetails?> queryRemoveAdsProduct() async {
    if (!await _iap.isAvailable()) return null;
    final response = await _iap.queryProductDetails({removeAdsProductId});
    if (response.productDetails.isEmpty) return null;
    return response.productDetails.first;
  }

  Future<void> buyRemoveAds() async {
    final ui = _ref.read(purchaseUiStateProvider.notifier);
    ui.state = PurchaseUiState.loading;
    try {
      final product = await queryRemoveAdsProduct();
      if (product == null) {
        ui.state = PurchaseUiState.error;
        return;
      }
      await _iap.buyNonConsumable(
        purchaseParam: PurchaseParam(productDetails: product),
      );
    } catch (e) {
      debugPrint('buyRemoveAds failed: $e');
      ui.state = PurchaseUiState.error;
    }
  }

  Future<void> restorePurchases() async {
    final ui = _ref.read(purchaseUiStateProvider.notifier);
    ui.state = PurchaseUiState.loading;
    try {
      await _iap.restorePurchases();
      // Restore results arrive on purchaseStream; fall back to idle after a
      // grace period so the button doesn't spin forever when nothing arrives.
      await Future.delayed(const Duration(seconds: 3));
      if (ui.state == PurchaseUiState.loading) {
        ui.state = PurchaseUiState.idle;
      }
    } catch (e) {
      debugPrint('restorePurchases failed: $e');
      ui.state = PurchaseUiState.error;
    }
  }

  void _onPurchaseUpdates(List<PurchaseDetails> purchases) {
    final ui = _ref.read(purchaseUiStateProvider.notifier);
    for (final purchase in purchases) {
      if (purchase.productID != removeAdsProductId) continue;

      switch (purchase.status) {
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          _ref.read(premiumStatusProvider.notifier).upgrade();
          ui.state = PurchaseUiState.idle;
          break;
        case PurchaseStatus.pending:
          ui.state = PurchaseUiState.pending;
          break;
        case PurchaseStatus.error:
          debugPrint('Purchase error: ${purchase.error}');
          ui.state = PurchaseUiState.error;
          break;
        case PurchaseStatus.canceled:
          ui.state = PurchaseUiState.idle;
          break;
      }

      if (purchase.pendingCompletePurchase) {
        _iap.completePurchase(purchase);
      }
    }
  }

  void dispose() {
    _subscription?.cancel();
    _subscription = null;
  }
}
