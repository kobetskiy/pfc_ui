import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class Weekcalendar extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final Function(DateTime selectedDay, DateTime focusedDay) onDaySelected;

  const Weekcalendar({
    super.key,
    required this.focusedDay,
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge!;

    return TableCalendar(
      firstDay: DateTime.utc(2024, 8, 1),
      lastDay: DateTime.utc(2024, 10, 31),
      focusedDay: focusedDay,
      selectedDayPredicate: (day) => isSameDay(selectedDay, day),
      onDaySelected: (selectedDay, focusedDay) {
        onDaySelected(selectedDay, focusedDay);
      },
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: CustomColors.primaryBlue.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        weekendTextStyle: textStyle,
        todayDecoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        todayTextStyle: textStyle,
        selectedTextStyle: textStyle.copyWith(
          color: CustomColors.primaryBlue,
        ),
        defaultTextStyle: textStyle,
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        leftChevronVisible: false,
        rightChevronVisible: false,
        titleTextStyle: textStyle,
        titleCentered: true,
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: textStyle.copyWith(
          color: CustomColors.lightGrey,
        ),
        weekendStyle: textStyle.copyWith(
          color: CustomColors.lightGrey,
        ),
      ),
      daysOfWeekVisible: true,
      rowHeight: 50,
      calendarFormat: CalendarFormat.week,
      startingDayOfWeek: StartingDayOfWeek.monday,
      locale: 'ru_RU',
    );
  }
}