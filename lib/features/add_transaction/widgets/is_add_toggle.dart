import 'package:flutter/material.dart';
import 'package:mo5y/features/shared/main_container/main_container.dart';

class IsAddToggle extends StatelessWidget {
  final bool isAdd;
  final Function(bool) onTap;
  const IsAddToggle({super.key, required this.isAdd, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      duration: 300,
      curve: Curves.easeInOutBack,
      height: 65,
      width: double.infinity,
      vPadding: 2,
      hPadding: 6,
      color: Theme.of(context).colorScheme.shadow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => onTap(true),
            child: MainContainer(
              duration: 300,
              curve: Curves.easeInOutBack,
              height: isAdd ? 48 : 42,
              width: isAdd ? 160 : 120,
              vPadding: 4,
              hPadding: 8,
              color: isAdd
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.shadow,
              child: Center(
                child: Text(
                  'Add',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
          ),
          // SizedBox(width: 10),
          GestureDetector(
            onTap: () => onTap(false),
            child: MainContainer(
              duration: 300,
              curve: Curves.easeInOutBack,
              height: !isAdd ? 48 : 42,
              width: !isAdd ? 160 : 120,
              vPadding: 4,
              hPadding: 8,
              color: !isAdd
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.shadow,
              child: Center(
                child: Text(
                  'Withdraw',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
