import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../../core/constants/color_constants.dart';

class CategoryPicker extends StatelessWidget {
  final String? selectedCategory;
  final List<String> categories;
  final ValueChanged<String?> onCategorySelected;

  const CategoryPicker({
    super.key,
    required this.selectedCategory,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showCategoryPicker(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorConstants.primaryColor.withOpacity(0.3),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              (selectedCategory ?? AppConstants.kSelectCategory).toUpperCase(),
              style: const TextStyle(
                color: ColorConstants.primaryColor,
                fontSize: 16,
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: ColorConstants.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  void _showCategoryPicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text(AppConstants.kSelectCategory),
          actions: categories.map((String category) {
            return CupertinoActionSheetAction(
              onPressed: () {
                onCategorySelected(category);
                Navigator.pop(context);
              },
              child: Text(category.toUpperCase()),
            );
          }).toList(),
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        );
      },
    );
  }
}
