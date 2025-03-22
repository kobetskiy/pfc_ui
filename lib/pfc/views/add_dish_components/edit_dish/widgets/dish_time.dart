import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/views/home_screen/widgets/widgets.dart';

class DishTime extends StatelessWidget {
  const DishTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      child: SubSection(
        child: Row(
          children: [
            Text(
              '16:00',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontFamily: 'AbhayaLibre', fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
