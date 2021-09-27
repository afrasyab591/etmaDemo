import 'package:etma_demo/res/colors.dart';
import 'package:etma_demo/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../res/assets.dart';

class CustomPopup {
  showLoader({
    BuildContext context,
    Function onPress,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return Material(
          color: AppColors.loaderBackgroundColor.withOpacity(0.5),
          child: Center(
            child: Container(
              height: sizes.height *0.35,
              width: sizes.width *0.35,
              child: Lottie.asset(Assets.apiLoading),
            ),
          ),
        );
      },
    );
  }

  hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }
}
