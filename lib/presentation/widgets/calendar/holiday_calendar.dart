import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';
import 'package:holiday_calendar/domain/entities/school_holiday.dart';
import 'package:holiday_calendar/domain/entities/vacation.dart';
import 'package:holiday_calendar/l10n/app_localizations.dart';
import 'package:holiday_calendar/presentation/providers/db_vacation_provider.dart';
import 'package:holiday_calendar/presentation/providers/holiday_provider.dart';
import 'package:holiday_calendar/presentation/providers/month_provider.dart';
import 'package:holiday_calendar/presentation/providers/school_holiday_provider.dart';
import 'package:holiday_calendar/presentation/providers/second_region_provider.dart';
import 'package:holiday_calendar/presentation/providers/state_provider.dart';
import 'package:holiday_calendar/presentation/providers/year_provider.dart';
import 'package:holiday_calendar/presentation/widgets/calendar/date_detail_sheet.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HolidayCalendar extends ConsumerStatefulWidget {
  const HolidayCalendar({super.key});

  @override
  ConsumerState<HolidayCalendar> createState() => _HolidayCalendarState();
}

class _HolidayCalendarState extends ConsumerState<HolidayCalendar> {
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final selectedYear = ref.watch(selectedYearProvider);
    final selectedMonth = ref.watch(selectedMonthProvider);
    final holidaysByDate = ref.watch(holidaysByDateProvider);
    final schoolHolidaysByDate = ref.watch(schoolHolidaysByDateProvider);
    final vacationsByDate = ref.watch(dbVacationsByDateProvider);
    final secondRegionByDate = ref.watch(secondRegionHolidaysByDateProvider);
    final selectedState = ref.watch(selectedFederalStateProvider);
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    final focusedDay = DateTime(selectedYear, selectedMonth, 1);

    return TableCalendar<Holiday>(
      firstDay: DateTime(selectedYear, 1, 1),
      lastDay: DateTime(selectedYear, 12, 31),
      focusedDay: focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      eventLoader: (day) {
        final normalizedDay = DateTime(day.year, day.month, day.day);
        return holidaysByDate[normalizedDay] ?? [];
      },
      startingDayOfWeek: StartingDayOfWeek.monday,
      locale: Localizations.localeOf(context).toString(),
      headerVisible: false,
      daysOfWeekHeight: 40,
      rowHeight: 52,
      weekNumbersVisible: true,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: theme.textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurface,
        ),
        weekendStyle: theme.textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.error,
        ),
      ),
      calendarBuilders: CalendarBuilders(
        // Week number builder (KW)
        weekNumberBuilder: (context, weekNumber) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 4),
            child: Text(
              l10n.calendarWeekNumber(weekNumber),
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.outline,
                fontSize: 10,
              ),
            ),
          );
        },
        // Default day builder
        defaultBuilder: (context, day, focusedDay) {
          return _buildDateCell(
            context,
            day,
            holidaysByDate,
            schoolHolidaysByDate,
            vacationsByDate,
            isToday: false,
            isSelected: false,
            isOutside: false,
          );
        },
        // Today builder - circle border
        todayBuilder: (context, day, focusedDay) {
          return _buildDateCell(
            context,
            day,
            holidaysByDate,
            schoolHolidaysByDate,
            vacationsByDate,
            isToday: true,
            isSelected: false,
            isOutside: false,
          );
        },
        // Selected day builder - filled circle
        selectedBuilder: (context, day, focusedDay) {
          return _buildDateCell(
            context,
            day,
            holidaysByDate,
            schoolHolidaysByDate,
            vacationsByDate,
            isToday: isSameDay(day, DateTime.now()),
            isSelected: true,
            isOutside: false,
          );
        },
        // Outside days (other months)
        outsideBuilder: (context, day, focusedDay) {
          return _buildDateCell(
            context,
            day,
            holidaysByDate,
            schoolHolidaysByDate,
            vacationsByDate,
            isToday: false,
            isSelected: false,
            isOutside: true,
          );
        },
        // Marker (dots) - holiday and/or school holiday and/or vacation
        markerBuilder: (context, date, events) {
          final normalizedDate = DateTime(date.year, date.month, date.day);
          final isSchoolHoliday =
              schoolHolidaysByDate.containsKey(normalizedDate);
          final hasHoliday = events.isNotEmpty;
          final isVacation = vacationsByDate.containsKey(normalizedDate);
          final isSecondRegionHoliday =
              secondRegionByDate.containsKey(normalizedDate);

          if (!hasHoliday &&
              !isSchoolHoliday &&
              !isVacation &&
              !isSecondRegionHoliday) {
            return null;
          }

          final dots = <Widget>[];

          if (hasHoliday) {
            final isNational = events.any((h) => h.global);
            dots.add(Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: isNational
                    ? theme.colorScheme.tertiary
                    : theme.colorScheme.outline,
                shape: BoxShape.circle,
              ),
            ));
          }

          if (isSchoolHoliday) {
            dots.add(Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                shape: BoxShape.circle,
              ),
            ));
          }

          if (isVacation) {
            dots.add(Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ));
          }

          // Grenzgänger overlay: holiday in the second region
          if (isSecondRegionHoliday) {
            dots.add(Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Colors.teal,
                shape: BoxShape.circle,
              ),
            ));
          }

          return Positioned(
            bottom: 10,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: dots
                  .map((dot) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: dot,
                      ))
                  .toList(),
            ),
          );
        },
      ),
      // Always show bottom sheet on day tap
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
        });
        ref.read(selectedMonthProvider.notifier).select(focusedDay.month);

        // Always show bottom sheet (design requirement)
        _showDateDetailSheet(
          context,
          selectedDay,
          holidaysByDate,
          schoolHolidaysByDate,
          vacationsByDate,
          secondRegionByDate,
          selectedState?.nameDE ?? l10n.allStates,
        );
      },
      onPageChanged: (focusedDay) {
        ref.read(selectedMonthProvider.notifier).select(focusedDay.month);
        ref.read(selectedYearProvider.notifier).select(focusedDay.year);
      },
    );
  }

  Widget _buildDateCell(
    BuildContext context,
    DateTime day,
    Map<DateTime, List<Holiday>> holidaysByDate,
    Map<DateTime, SchoolHoliday> schoolHolidaysByDate,
    Map<DateTime, Vacation> vacationsByDate, {
    required bool isToday,
    required bool isSelected,
    required bool isOutside,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final normalizedDay = DateTime(day.year, day.month, day.day);
    final holidays = holidaysByDate[normalizedDay] ?? [];
    final isHoliday = holidays.isNotEmpty;
    final isNationalHoliday = holidays.any((h) => h.global);
    final isWeekend = day.weekday == DateTime.saturday || day.weekday == DateTime.sunday;
    final isSchoolHoliday = schoolHolidaysByDate.containsKey(normalizedDay);
    final isVacation = vacationsByDate.containsKey(normalizedDay);

    // Background color
    Color? backgroundColor;
    if (isSelected) {
      backgroundColor = colorScheme.primary;
    } else if (isNationalHoliday && !isOutside) {
      backgroundColor = colorScheme.tertiaryContainer.withValues(alpha: 0.5);
    } else if (isHoliday && !isOutside) {
      backgroundColor = colorScheme.tertiaryContainer.withValues(alpha: 0.25);
    } else if (isSchoolHoliday && !isOutside) {
      backgroundColor = colorScheme.secondaryContainer.withValues(alpha: 0.4);
    } else if (isVacation && !isOutside) {
      backgroundColor = Colors.orange.withValues(alpha: 0.2);
    }

    // Border (only for today, not selected)
    BoxBorder? border;
    if (isToday && !isSelected) {
      border = Border.all(
        color: colorScheme.primary,
        width: 2,
      );
    }

    // Text color based on state priority
    // National holidays: tertiary, Regional holidays: outline (lighter)
    Color textColor;
    if (isOutside) {
      textColor = colorScheme.outline;
    } else if (isSelected) {
      textColor = colorScheme.onPrimary;
    } else if (isNationalHoliday) {
      textColor = colorScheme.tertiary;
    } else if (isHoliday) {
      // Regional holiday - lighter color
      textColor = colorScheme.outline;
    } else if (isWeekend) {
      textColor = colorScheme.error;
    } else if (isToday) {
      textColor = colorScheme.primary;
    } else {
      textColor = colorScheme.onSurface;
    }

    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: border,
      ),
      child: Center(
        child: Text(
          '${day.day}',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: textColor,
            fontWeight: isToday || isSelected || isNationalHoliday
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  void _showDateDetailSheet(
    BuildContext context,
    DateTime day,
    Map<DateTime, List<Holiday>> holidaysByDate,
    Map<DateTime, SchoolHoliday> schoolHolidaysByDate,
    Map<DateTime, Vacation> vacationsByDate,
    Map<DateTime, List<Holiday>> secondRegionByDate,
    String bundesland,
  ) {
    final normalizedDay = DateTime(day.year, day.month, day.day);
    final holidays = holidaysByDate[normalizedDay] ?? [];
    final schoolHoliday = schoolHolidaysByDate[normalizedDay];
    final vacation = vacationsByDate[normalizedDay];
    final secondRegionHolidays = secondRegionByDate[normalizedDay] ?? [];
    final secondRegion = ref.read(secondRegionProvider);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => DateDetailSheet(
        date: day,
        holidays: holidays,
        bundesland: bundesland,
        schoolHoliday: schoolHoliday,
        vacation: vacation,
        secondRegionHolidays: secondRegionHolidays,
        secondRegionName: secondRegion?.nameDE,
        onAddVacation: () {
          Navigator.pop(ctx);
          _showAddVacationDialog(context, day, ref);
        },
        onDeleteVacation: vacation != null
            ? () {
                ref
                    .read(vacationNotifierProvider.notifier)
                    .deleteVacation(vacation.id);
                Navigator.pop(ctx);
              }
            : null,
      ),
    );
  }

  void _showAddVacationDialog(
      BuildContext context, DateTime initialDate, WidgetRef ref) {
    DateTime startDate = initialDate;
    DateTime endDate = initialDate;
    final titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) {
        final l10n = AppLocalizations.of(ctx)!;
        return StatefulBuilder(
        builder: (ctx, setState) => AlertDialog(
          title: Text(l10n.addVacation),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                    labelText: l10n.labelOptional),
              ),
              const SizedBox(height: 16),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.from),
                subtitle: Text(
                    DateFormat('d. MMMM yyyy', Localizations.localeOf(ctx).languageCode)
                        .format(startDate)),
                trailing: const Icon(Icons.calendar_today, size: 18),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: ctx,
                    initialDate: startDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    setState(() {
                      startDate = picked;
                      if (endDate.isBefore(startDate)) endDate = startDate;
                    });
                  }
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.to),
                subtitle: Text(
                    DateFormat('d. MMMM yyyy', Localizations.localeOf(ctx).languageCode)
                        .format(endDate)),
                trailing: const Icon(Icons.calendar_today, size: 18),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: ctx,
                    initialDate: endDate,
                    firstDate: startDate,
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) setState(() => endDate = picked);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              onPressed: () {
                final title = titleController.text.trim().isEmpty
                    ? l10n.vacationDefaultTitle
                    : titleController.text.trim();
                ref.read(vacationNotifierProvider.notifier).addVacation(
                      title: title,
                      startDate: startDate,
                      endDate: endDate,
                    );
                Navigator.pop(ctx);
              },
              child: Text(l10n.save),
            ),
          ],
        ),
      );
      },
    );
  }
}
