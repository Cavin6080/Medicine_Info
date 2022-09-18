import 'package:flutter/material.dart';
import 'package:medicine_info/models/medicine_model.dart';
import 'package:medicine_info/styles/app_colors.dart';
import 'package:medicine_info/widgets/medicine_image.dart';
import 'package:medicine_info/widgets/medicine_item_image_wrapper.dart';
import 'package:medicine_info/widgets/medicine_list_item_text.dart';
import 'package:sizer/sizer.dart';

class MedicineListItem extends StatefulWidget {
  final Medicine medicine;
  const MedicineListItem({Key? key, required this.medicine}) : super(key: key);

  @override
  State<MedicineListItem> createState() => _MedicineListItemState();
}

class _MedicineListItemState extends State<MedicineListItem> {
  double medicineImageRotationAngle = 0;

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width * 0.45;
    return Padding(
      padding: EdgeInsets.all(12),
      child: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: '__recipe_image_bg__',
              // tag: '__recipe_${widget.recipe.id}_image_bg__',
              child: Container(
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  color: widget.medicine.bgColor,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.orangeDark.withOpacity(
                        AppColors.getBrightness(widget.medicine.bgColor) ==
                                Brightness.dark
                            ? 0.5
                            : 0.2,
                      ),
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                // child: RecipeListItemImage(recipe),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              alignment: Alignment.bottomRight,
              child: MedicineListItemImageWrapper(
                child: MedicineImage(
                  widget.medicine,
                  imageRotationAngle: medicineImageRotationAngle,
                  imageSize: imageSize,
                  alignment: Alignment.bottomRight,
                  hasShadow: false,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: MedicineListItemText(widget.medicine),
              ),
              Expanded(
                flex: 2,
                child: Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
