import 'package:flutter/material.dart';
import 'package:medicine_info/models/medicine_model.dart';
import 'package:medicine_info/styles/app_colors.dart';

class MedicineListItemText extends StatelessWidget {
  const MedicineListItemText(
    this.menuItem, {
    Key? key,
  }) : super(key: key);

  final Medicine menuItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: '__recipe_${menuItem.id}_title__',
            child: Text(
              menuItem.title,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: AppColors.textColorFromBackground(menuItem.bgColor),
                  ),
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: Hero(
              tag: '__recipe_${menuItem.id}_description__',
              child: Text(
                menuItem.description,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color:
                          AppColors.textColorFromBackground(menuItem.bgColor),
                    ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
