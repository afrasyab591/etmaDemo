import 'package:etma_demo/res/assets.dart';
import 'package:etma_demo/res/colors.dart';
import 'package:etma_demo/res/res.dart';
import 'package:etma_demo/res/strings.dart';
import 'package:etma_demo/widgets/text_views.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CommonWidgets {
  static String userId = "51";
  static String supervisorId = "55";

  static Widget getPNGPicture(
      {@required double height, @required double width, @required String image}) {
    return Container(
        height: height,
        width: width,
        child: Image(
          image: AssetImage(image),
          height: height,
          width: width,
          fit: BoxFit.fill,
        )

    );
  }

  static Widget getMicrosoftButton(
      {@required String text, @required Function onPress}) {
    return Container(
      height: sizes.height * 0.068,
      width: sizes.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.lightGreyColor,
      ),
      child: FlatButton(
          onPressed: () => onPress(),
          child:
          Row(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: sizes.width * 0.05,
              ),
              Container(
                  height: sizes.height * 0.028,
                  width: sizes.width * 0.06,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: sizes.height * 0.012,
                            width: sizes.width * 0.025,
                            decoration: BoxDecoration(
                              color: AppColors.redColor,
                            ),
                          ),
                          SizedBox(width: sizes.widthRatio * 1),
                          Container(
                            height: sizes.height * 0.012,
                            width: sizes.width * 0.025,
                            decoration: BoxDecoration(
                              color: AppColors.greenWindowColor,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: sizes.heightRatio * 1),
                      Row(
                        children: [
                          Container(
                            height: sizes.height * 0.012,
                            width: sizes.width * 0.025,
                            decoration: BoxDecoration(
                              color: AppColors.blueWindowColor,
                            ),
                          ),
                          SizedBox(width: sizes.widthRatio * 1),
                          Container(
                            height: sizes.height * 0.012,
                            width: sizes.width * 0.025,
                            decoration: BoxDecoration(
                              color: AppColors.yellowWindowColor,
                            ),
                          )
                        ],
                      )
                    ],
                  )),
              SizedBox(
                width: sizes.width * 0.05,
              ),
              TextView.getRegularText(text, Assets.poppinsRegular, color: AppColors.blackColor, lines: 1),
            ],
          )
      ),
    );
  }


  static Widget getAppBarArrowSubmit(
      {@required String text, @required Function onPress, @required Function onPressSubmit, @required bool isShow}) {
    return Container(
      width:  sizes.width,
      height: sizes.height * 0.09,
      padding: EdgeInsets.symmetric(horizontal: sizes.width * 0.06),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => onPress(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: sizes.width * 0.02),
              height: sizes.height * 0.04,
              width: sizes.width * 0.08,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                border: Border.all(color: AppColors.lightBorderColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColors.blackColor,
                size: 20,
              ),
            ),
          ),
          SizedBox(width: sizes.width * 0.03),
          Row(
            children: [
              Container(
                  width: sizes.width * 0.56,
                  child: TextView.getLargeText(text, Assets.poppinsSemiBold, color: AppColors.blackColor, lines: 1)
              ),
              isShow ?
              GestureDetector(
                onTap: () => onPressSubmit(),
                child: Container(
                  height: sizes.height * 0.035,
                  width: sizes.width * 0.19,
                  decoration: BoxDecoration(
                    color: AppColors.submitBlueColor,
                    //border: Border.all(color: AppColors.blackColor.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: TextView.getSmallText(Strings.submit, Assets.poppinsMedium,
                        color: AppColors.whiteColor,
                        lines: 1),
                  ),
                ),
              ): Container()
            ],
          ),
        ],
      ),
    );
  }

  static Widget getBookletContainer({
    @required Function onPress,
    @required String bookletName,
    @required String qualificationType,
    @required String type,
    @required String version,
    @required bool isSubmit,
    @required double completePercentage,
    @required final boxColor
  }) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        //height: sizes.height * 0.15,
        width: sizes.width,
        padding: EdgeInsets.all(sizes.width*0.02),
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
        child: Column(
          children: [
            Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  //height: sizes.height * 0.075,
                  width: sizes.width * 0.145,
                  padding: EdgeInsets.all(sizes.width*0.025),
                  margin: EdgeInsets.all(sizes.width*0.02),
                  decoration: BoxDecoration(
                    color: boxColor,
                    border: Border.all(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset(Assets.boxInside),
                ),
                SizedBox(width: sizes.widthRatio * 10),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: sizes.width*0.01),
                      child: Row(
                        children: [
                          Container(
                              width: sizes.width * 0.25,
                              child: TextView.getMediumText(bookletName, Assets.poppinsSemiBold, color: isSubmit? AppColors.blackColor.withOpacity(0.5): AppColors.blackColor, lines: 1)),
                          SizedBox(width: sizes.widthRatio * 15),
                          isSubmit?
                          TextView.getMediumTextlight('(Submitted)', Assets.poppinsLight, color: AppColors.bluePopUpButtonColor, lines: 1): Container(),
                        ],
                      ),
                    ),
                    SizedBox(height: sizes.heightRatio * 3),
                    Container(
                      width: sizes.width*0.6,
                      padding: EdgeInsets.symmetric(horizontal: sizes.width*0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView.getRegularText13(qualificationType, Assets.poppinsSemiBold, color: isSubmit ? AppColors.blackColor.withOpacity(0.5): AppColors.blackColor, lines: 1),
                          TextView.getRegularText13("Type: $type", Assets.poppinsSemiBold, color: isSubmit? AppColors.blackColor.withOpacity(0.5): AppColors.blackColor, lines: 1),
                        ],
                      ),
                    ),
                    SizedBox(height: sizes.heightRatio * 6),
                    LinearPercentIndicator(
                      width: sizes.width*0.62,
                      lineHeight: sizes.height*0.015,
                      percent: completePercentage,
                      backgroundColor: AppColors.remainingBarColor,
                      progressColor: isSubmit? AppColors.progressBarColor.withOpacity(0.5): AppColors.progressBarColor,
                    ),
                    SizedBox(height: sizes.heightRatio * 5),
                    Container(
                      width: sizes.width*0.6,
                      padding: EdgeInsets.symmetric(horizontal: sizes.width*0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView.getSmallText((completePercentage*100).toInt().toString() + "%", Assets.poppinsMedium, color: isSubmit? AppColors.blackColor.withOpacity(0.5): AppColors.blackColor, lines: 1),
                          TextView.getSmallTextItalic("Version $version ", Assets.poppinsMedium, color: isSubmit ? AppColors.bluePopUpButtonColor.withOpacity(0.5): AppColors.bluePopUpButtonColor, lines: 1),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  static Widget getBottomButton(
      {@required String text, @required Function onPress,double width,double margin}) {
    return Container(
      height: sizes.height * 0.068,
      width: width ?? sizes.width,
      margin: margin != null ?EdgeInsets.symmetric(horizontal: margin) :EdgeInsets.symmetric(horizontal: sizes.width * 0.06),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.submitBlueColor,
          //border: Border.all(color: AppColors.buttonBorderColor)
      ),
      child: FlatButton(
          onPressed: () => onPress(),
          child: TextView.getRegularText(text, Assets.poppinsMedium, color: AppColors.whiteColor, lines: 1)
      ),
    );
  }

  static Widget getEmptyBottomButton(
      {@required String text, @required Function onPress,double width,double margin}) {
    return Container(
      height: sizes.height * 0.068,
      width: width ?? sizes.width,
      margin: EdgeInsets.symmetric(horizontal: margin) ?? EdgeInsets.symmetric(horizontal: sizes.width * 0.06),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.buttonBorderColor)
      ),
      child: FlatButton(
          onPressed: () => onPress(),
          child: TextView.getRegularText(text, Assets.poppinsMedium, color: AppColors.buttonBorderColor, lines: 1)
      ),
    );
  }

  static Widget getTextField({
    @required bool isPassword,
    @required TextEditingController textEditingController,
    @required String hintText,
    @required bool filledField,
  }) {
    return Container(
      height: sizes.height * 0.07,
      //width: sizes.width * 0.85,
      padding: EdgeInsets.symmetric(horizontal: sizes.width * 0.05),
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor,
        //border: Border.all(color: AppColors.lightGray),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Container(
              // color: AppColors.yellow,
              width: sizes.width * 0.62,
              // height: AppSizes.height * 0.05,
              child: TextField(
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: Assets.poppinsLight,
                  fontSize: 13,
                  color: AppColors.blackColor,
                ),
                controller: textEditingController,
                obscureText: isPassword,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 13,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ),
          ),
          filledField
              ? Container(
              height: sizes.height * 0.035,
              width: sizes.width * 0.06,
              child: Image(
                  image: AssetImage(Assets.checked)))
              : Container(),
        ],
      ),
    );
  }

  static Widget getDateField({@required String date, @required Function onPressDate}) {
    return GestureDetector(
      onTap: onPressDate,
      child: Container(
        height: sizes.height * 0.07,
        //width: sizes.width * 0.85,
        padding: EdgeInsets.symmetric(horizontal: sizes.width * 0.05),
        decoration: BoxDecoration(
          color: AppColors.lightGreyColor,
          //border: Border.all(color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Container(
                // color: AppColors.yellow,
                width: sizes.width * 0.62,
                // height: AppSizes.height * 0.05,
                child: TextView.getRegularText13(date, Assets.poppinsLight, color: AppColors.blackColor, lines: 1),
              ),
            ),
            Container(
                height: sizes.height * 0.035,
                width: sizes.width * 0.06,
                child: Image(
                    image: AssetImage(Assets.checked)))
          ],
        ),
      ),
    );
  }
  static Widget onNullData({@required String text}){
    return Container(
      // margin: EdgeInsets.only(top: 10, bottom: 25),
      child: Center(
        child: TextView.getMediumTextlight(
            text, Assets.poppinsLight,
            color: AppColors.blackColor,
            lines: 1)
      ),
    );
  }

  static Color getColorFromRgb(String rgb){
    int r,g,b =0;
    double a = 0.0;
    rgb = rgb.replaceAll("RGBA(", "");
    rgb = rgb.replaceAll(")", "");
    List<String> rgba = rgb.split(",");
    r = int.parse(rgba[0]);
    g = int.parse(rgba[1]);
    b = int.parse(rgba[2]);
    a = double.parse(rgba[3]);

    //return Color.fromRGBO(r, g, b, a);
    return Color.fromRGBO(33, 150, 243, 1);
  }

}