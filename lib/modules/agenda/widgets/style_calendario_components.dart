import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class StyleCalendario extends StatelessWidget {
  const StyleCalendario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarDatePicker2(
          initialValue: [
            DateTime.now(),
          ],
          selectableDayPredicate: (day) => !day
              .difference(DateTime.now().subtract(const Duration(days: 3)))
              .isNegative,
          config: CalendarDatePicker2Config(
            selectedDayHighlightColor: Colors.blueAccent[900],
            weekdayLabels: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab'],
            weekdayLabelTextStyle: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
            controlsHeight: 50,
            controlsTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            dayTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            disabledDayTextStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
