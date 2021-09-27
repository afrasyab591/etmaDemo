import 'package:etma_demo/res/assets.dart';
import 'package:etma_demo/res/colors.dart';
import 'package:etma_demo/res/res.dart';
import 'package:etma_demo/widgets/text_views.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookletDetailComponents {
  Widget getCategoryBox({
    @required String categoryTitle,
    @required String status,
    @required Function onPress,
  }) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        height: sizes.height * 0.06,
        width: sizes.width,
        decoration: BoxDecoration(
            color: AppColors.lightGreyColor,
            border: Border.all(color: AppColors.borderColor.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[500].withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 0))
            ]),
        child: Row(
          children: [
            Container(
              width: sizes.width * 0.55,
              padding: EdgeInsets.symmetric(horizontal: sizes.width * 0.05),
              child: TextView.getRegularText(categoryTitle, Assets.poppinsLight, color: AppColors.greyTextColor, lines: 1),
            ),
            //SizedBox(width: sizes.widthRatio * 3),
            Container(
              width: sizes.width * 0.3,
              child: TextView.getRegularText("|   $status", Assets.poppinsLight, color: AppColors.greyTextColor, lines: 1),
            ),
          ],
        ),
      ),
    );
  }
}