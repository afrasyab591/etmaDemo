import 'package:etma_demo/res/assets.dart';
import 'package:etma_demo/res/colors.dart';
import 'package:etma_demo/res/res.dart';
import 'package:etma_demo/widgets/text_views.dart';
import 'package:flutter/cupertino.dart';

class WelcomeComponents {

  Widget getPremiumTextBox({@required String heading,
    @required String subHeading
  }) {
    return Container(
      height: sizes.height*0.2,
      width: sizes.width,
      padding: EdgeInsets.only(top: sizes.height * 0.04, bottom:  sizes.height * 0.005),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextView.getExtraLargeText(
              heading,
              Assets.poppinsBold,
              color: AppColors.blueTextColor,
              lines: 1),
          SizedBox(height: sizes.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: sizes.width * 0.89,
                child: TextView.getRegular13Text(
                    subHeading,
                    Assets.poppinsRegular,
                    color: AppColors.greyTextColor,
                    lines: 2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}