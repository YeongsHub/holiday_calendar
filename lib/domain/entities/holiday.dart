import 'package:freezed_annotation/freezed_annotation.dart';

part 'holiday.freezed.dart';

@freezed
class Holiday with _$Holiday {
  const factory Holiday({
    required DateTime date,
    required String localName,
    required String name,
    required String countryCode,
    required bool fixed,
    required bool global,
    List<String>? counties,
    List<String>? types,
  }) = _Holiday;

  const Holiday._();

  /// Display name resolved to the active app language.
  ///
  /// The OpenHolidays API only provides German ([localName]) and English
  /// ([name]) holiday names, so every non-German locale falls back to the
  /// English name. Pass `languageCode` from `Localizations.localeOf(context)`.
  String displayName(String languageCode) =>
      languageCode == 'de' ? localName : name;

  /// Check if this holiday applies to a specific Bundesland
  ///
  /// - If global (nationwide) → applies to all states
  /// - If not global but no stateCode selected → show all holidays
  /// - If not global and stateCode selected → check if state is in counties list
  bool isApplicableTo(String? stateCode) {
    // Nationwide holidays apply to everyone
    if (global) return true;

    // If no state filter, show all holidays (including regional)
    if (stateCode == null) return true;

    // Regional holiday: must have counties and state must be in the list
    // If counties is null/empty for a non-global holiday, it means
    // we don't know which states it applies to - don't show it
    if (counties == null || counties!.isEmpty) return false;

    // Prefix match: Swiss holidays can list sub-canton districts
    // (e.g. "CH-FR-LA-RI"), which still belong to the canton "CH-FR".
    return counties!.any((c) => c == stateCode || c.startsWith('$stateCode-'));
  }
}
