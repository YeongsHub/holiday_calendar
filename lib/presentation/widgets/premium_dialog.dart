import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/core/services/purchase_service.dart';
import 'package:holiday_calendar/l10n/app_localizations.dart';
import 'package:holiday_calendar/presentation/providers/premium_provider.dart';

/// "Remove ads" purchase dialog, opened from the home AppBar.
class PremiumDialog extends ConsumerWidget {
  const PremiumDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => const PremiumDialog(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final isPremium =
        ref.watch(premiumStatusProvider).valueOrNull ?? false;
    final uiState = ref.watch(purchaseUiStateProvider);
    final productAsync = ref.watch(removeAdsProductProvider);

    if (isPremium) {
      return AlertDialog(
        icon: const Icon(Icons.verified_rounded, size: 40),
        title: Text(l10n.premiumActiveTitle),
        content: Text(
          l10n.premiumActiveSubtitle,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.close),
          ),
        ],
      );
    }

    final price = productAsync.valueOrNull?.price;
    final isBusy = uiState == PurchaseUiState.loading ||
        uiState == PurchaseUiState.pending;

    return AlertDialog(
      icon: const Icon(Icons.workspace_premium_rounded, size: 40),
      title: Text(l10n.removeAdsTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(l10n.removeAdsSubtitle, textAlign: TextAlign.center),
          if (uiState == PurchaseUiState.error) ...[
            const SizedBox(height: 12),
            Text(
              l10n.purchaseError,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 12,
              ),
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: isBusy
              ? null
              : () => ref.read(purchaseServiceProvider).restorePurchases(),
          child: Text(l10n.restorePurchases),
        ),
        FilledButton(
          onPressed: isBusy
              ? null
              : () => ref.read(purchaseServiceProvider).buyRemoveAds(),
          child: isBusy
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(
                  price != null ? l10n.buyForPrice(price) : l10n.buyNow,
                ),
        ),
      ],
    );
  }
}
