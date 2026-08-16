import 'package:flutter/material.dart';
import 'package:mo5y/core/models/transaction_category_model.dart';
import 'package:mo5y/features/shared/main_container/main_container.dart';

class CategoriesList extends StatelessWidget {
  final TransactionCategory category;
  final Function(TransactionCategory) onTap;
  const CategoriesList({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final categoryList = TransactionCategory.values;
    return Column(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Categories', style: Theme.of(context).textTheme.titleSmall),
              GestureDetector(
                onTap: () => onTap(TransactionCategory.other),
                child: MainContainer(
                  duration: 300,
                  curve: Curves.easeInOutBack,
                  height: category == TransactionCategory.other ? 35 : 30,
                  width: category == TransactionCategory.other ? 80 : 70,
                  vPadding: 2,
                  hPadding: 2,
                  color: category == TransactionCategory.other
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.shadow,
                  child: Center(
                    child: Text(
                      TransactionCategory.other.label,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: category == TransactionCategory.other
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          spacing: 12,
          children: List.generate(2, (index) {
            int indexToggle = index == 0 ? 0 : 4;
            return SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(4, (index) {
                  index = index + indexToggle;
                  return GestureDetector(
                    onTap: () => onTap(categoryList[index]),
                    child: MainContainer(
                      duration: 300,
                      curve: Curves.easeInOutBack,
                      height: categoryList[index] == category ? 100 : 90,
                      width: categoryList[index] == category ? 80 : 70,
                      vPadding: 4,
                      hPadding: 4,
                      color: categoryList[index] == category
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.shadow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            categoryList[index].icon,
                            size: categoryList[index] == category ? 26 : 22,
                            color: categoryList[index] == category
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onSurface,
                          ),
                          Text(
                            categoryList[index].label,
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(
                                  color: categoryList[index] == category
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).colorScheme.onSurface,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            );
          }),
        ),
      ],
    );
  }
}
