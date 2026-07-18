import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';

part 'open_holiday_model.freezed.dart';
part 'open_holiday_model.g.dart';

/// Model for OpenHolidays API response
/// API: https://openholidaysapi.org
@freezed
class OpenHolidayModel with _$OpenHolidayModel {
  const factory OpenHolidayModel({
    required String id,
    required String startDate,
    required String endDate,
    required String type,
    required List<LocalizedText> name,
    required bool nationwide,
    List<Subdivision>? subdivisions,
  }) = _OpenHolidayModel;

  const OpenHolidayModel._();

  factory OpenHolidayModel.fromJson(Map<String, dynamic> json) =>
      _$OpenHolidayModelFromJson(json);

  /// Convert to domain entity
  Holiday toEntity({String countryCode = 'DE'}) {
    // Get German name or fall back to first available
    final localName = name.firstWhere(
      (n) => n.language == 'DE',
      orElse: () => name.first,
    ).text;

    // Get English name for international display
    final englishName = name.firstWhere(
      (n) => n.language == 'EN',
      orElse: () => name.first,
    ).text;

    // Convert subdivisions to county codes (e.g., "DE-BY" -> "DE-BY")
    final counties = subdivisions?.map((s) => s.code).toList();

    return Holiday(
      date: DateTime.parse(startDate),
      localName: localName,
      name: englishName,
      countryCode: countryCode,
      fixed: type == 'Public',
      global: nationwide,
      counties: counties,
      types: [type],
    );
  }
}

@freezed
class LocalizedText with _$LocalizedText {
  const factory LocalizedText({
    required String language,
    required String text,
  }) = _LocalizedText;

  factory LocalizedText.fromJson(Map<String, dynamic> json) =>
      _$LocalizedTextFromJson(json);
}

@freezed
class Subdivision with _$Subdivision {
  const factory Subdivision({
    required String code,
    required String shortName,
  }) = _Subdivision;

  factory Subdivision.fromJson(Map<String, dynamic> json) =>
      _$SubdivisionFromJson(json);
}
