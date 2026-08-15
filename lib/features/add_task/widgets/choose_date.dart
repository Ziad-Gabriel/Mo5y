import 'package:flutter/material.dart';
import 'package:mo5y/core/utils/date_formatter.dart';
import 'package:mo5y/features/shared/date_picker/main_date_picker.dart';
import 'package:mo5y/features/shared/main_container/main_container.dart';

class ChooseDate extends StatefulWidget {
  final DateTime? date;
  final Function(DateTime?) onTap;
  const ChooseDate({super.key, this.date, required this.onTap});

  @override
  State<ChooseDate> createState() => _ChooseDateState();
}

class _ChooseDateState extends State<ChooseDate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select End Date', style: Theme.of(context).textTheme.titleMedium),

        SizedBox(height: 10),
        GestureDetector(
          onTap: () async {
            DateTime? selectedDate = await customDatePicker(context);

            widget.onTap(selectedDate);
          },
          child: MainContainer(
            duration: 0,
            curve: Curves.linear,
            height: 65,
            width: double.infinity,
            vPadding: 0,
            hPadding: 12,
            color: Theme.of(context).colorScheme.shadow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  widget.date == null
                      ? customDateFormatter(
                          date: DateTime.now().add(Duration(days: 1)),
                        )
                      : customDateFormatter(date: widget.date!),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 22,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
