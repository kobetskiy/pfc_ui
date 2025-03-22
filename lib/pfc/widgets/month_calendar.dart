// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthCalendar extends StatefulWidget {
  const MonthCalendar({super.key});

  @override
  _MonthCalendarState createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge!;
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2024, 8, 1),
          lastDay: DateTime.utc(2024, 10, 31),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          calendarStyle: CalendarStyle(
            selectedDecoration: BoxDecoration(
              color: CustomColors.primaryBlue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            weekendTextStyle: textStyle.copyWith(fontFamily: 'AbhayaLibre'),
            todayDecoration: const BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            todayTextStyle: textStyle.copyWith(fontFamily: 'AbhayaLibre'),
            selectedTextStyle: textStyle.copyWith(
              fontFamily: 'AbhayaLibre',
              color: CustomColors.primaryBlue,
              fontStyle: FontStyle.italic,
            ),
            defaultTextStyle: textStyle.copyWith(
              fontFamily: 'AbhayaLibre',
              fontStyle: FontStyle.italic,
            ),
          ),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextStyle: textStyle,
            leftChevronIcon: const Icon(Icons.chevron_left),
            rightChevronIcon: const Icon(Icons.chevron_right),
          ),
          daysOfWeekVisible: false,
          rowHeight: 50,
          availableCalendarFormats: const {CalendarFormat.month: 'Month'},
          onFormatChanged: (format) {},
          calendarFormat: CalendarFormat.month,
        ),
      ],
    );
  }
}
