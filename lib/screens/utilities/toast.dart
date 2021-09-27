import 'package:etma_demo/res/assets.dart';
import 'package:etma_demo/res/colors.dart';
import 'package:etma_demo/res/res.dart';
import 'package:etma_demo/widgets/common_widgets.dart';
import 'package:etma_demo/widgets/text_views.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoastalert/FlutterToastAlert.dart';



class ApplicationToast{

  static getErrorToast({@required int durationTime, @required String heading, @required String subHeading}) async{
    await FlutterToastAlert.showToastAndAlert(
      toastDuration: durationTime,
      toastShowIcon: true,
      type: Type.Error,
      androidToast: subHeading,
      iosTitle: heading,
      iosSubtitle: subHeading,
    );
  }
  static getWarningToast({@required int durationTime, @required String heading, @required String subHeading}) async{
    await FlutterToastAlert.showToastAndAlert(
      toastDuration: durationTime,
      toastShowIcon: true,
      type: Type.Warning,
      androidToast: subHeading,
      iosTitle: heading,
      iosSubtitle: subHeading,
    );
  }

  static getSuccessToast(
      {@required int durationTime,
        @required String heading,
        @required String subHeading}) async {
    await FlutterToastAlert.showToastAndAlert(
      toastDuration: durationTime,
      toastShowIcon: true,
      type: Type.Success,
      androidToast: subHeading,
      iosTitle: heading,
      iosSubtitle: subHeading,
    );
  }

  static getAcceptOrRejectPopUp({
    @required BuildContext context,
    @required Function onCancel,
    @required Function onOk,
    @required String heading,
    @required String subHeading,

  }) {
    return {
      {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: AppColors.popupBackgroundColor,
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: sizes.width * 0.08,
                          right: sizes.width * 0.08),
                      height: sizes.height * 0.42,
                      //color: AppColors.whiteColor,
                      width: sizes.width,
                      decoration: BoxDecoration(
                        color: AppColors.bluePopUpColor,
                        // border: Border.all(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: sizes.height * 0.15,
                            width: sizes.width,
                            // decoration: BoxDecoration(
                            //   color: AppColors.whiteColor,
                            //   shape: BoxShape.circle,
                            // ),
                            // margin: EdgeInsets.only(
                            //   left: sizes.width * 0.1,
                            //   right: sizes.width * 0.1,
                            //   //top: sizes.width * 0.08,
                            // ),
                            //color: AppColors.bluePopUpColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: sizes.height * 0.09,
                                  width: sizes.width * 0.2,
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(Assets.tickIcon),
                                  // Icon(
                                  //   Icons.check,
                                  //   size: 50.0,
                                  //   color: AppColors.lightPurpleColor,
                                  // ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // margin: EdgeInsets.only(
                            //   left: sizes.width * 0.1,
                            //   right: sizes.width * 0.1,
                            //   top: sizes.width * 0.08,
                            // ),
                            padding: EdgeInsets.only(
                              top: sizes.height * 0.02,
                              left: sizes.width * 0.05,
                              right: sizes.width * 0.05,
                            ),
                            height: sizes.height * 0.27,
                            width: sizes.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                              Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  //height: sizes.height * 0.1,
                                  // color: AppColors.greenBoxColor,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(height: sizes.heightRatio * 5),
                                        TextView.getExtraLargeText(heading, Assets.poppinsBold, color: AppColors.blackColor, lines: 1),
                                        SizedBox(height: sizes.heightRatio * 10),
                                        TextView.getMediumTextlight(
                                            subHeading, Assets.poppinsRegular, color: AppColors.blackColor, lines: 3,
                                            textAlign: TextAlign.center
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //SizedBox(height: sizes.height * 0.01),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () => onCancel(),
                                      child: Container(
                                        height: sizes.height * 0.05,
                                        width: sizes.width * 0.3,
                                        decoration: BoxDecoration(
                                          //color: AppColors.blackColor,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: AppColors.bluePopUpButtonColor),
                                        ),
                                        alignment: Alignment.center,
                                        child: TextView.getRegularText(
                                            "Cancel", Assets.poppinsMedium,
                                            color: AppColors.bluePopUpButtonColor,
                                            lines: 1,
                                            textAlign: TextAlign.center),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => onOk(),
                                      child: Container(
                                        height: sizes.height * 0.05,
                                        width: sizes.width * 0.3,
                                        decoration: BoxDecoration(
                                            color: AppColors.bluePopUpButtonColor,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            border: Border.all(
                                              color: AppColors.bluePopUpButtonColor,
                                            )),
                                        alignment: Alignment.center,
                                        child: TextView.getRegularText(
                                            "Ok", Assets.poppinsMedium,
                                            color: AppColors.whiteColor,
                                            lines: 1,
                                            textAlign: TextAlign.center),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: sizes.height * 0.01),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),)
              ,
            );
          },
        )
      },
    };
  }

  static getSubmitPopUp({
    @required BuildContext context,
    @required Function onPressOk,
    @required String heading,
    @required String subHeading,

  }) {
    return {
      {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: AppColors.popupBackgroundColor,
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: sizes.width * 0.08,
                          right: sizes.width * 0.08),
                      height: sizes.height * 0.42,
                      //color: AppColors.whiteColor,
                      width: sizes.width,
                      decoration: BoxDecoration(
                        color: AppColors.bluePopUpColor,
                        // border: Border.all(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: sizes.height * 0.15,
                            width: sizes.width * 0.2,
                            // margin: EdgeInsets.only(
                            //   left: sizes.width * 0.1,
                            //   right: sizes.width * 0.1,
                            //   //top: sizes.width * 0.08,
                            // ),
                            //color: AppColors.bluePopUpColor,
                            child: Image.asset(Assets.submitIcon),
                          ),
                          Container(
                            // margin: EdgeInsets.only(
                            //   left: sizes.width * 0.1,
                            //   right: sizes.width * 0.1,
                            //   top: sizes.width * 0.08,
                            // ),
                            padding: EdgeInsets.only(
                              top: sizes.height * 0.02,
                              left: sizes.width * 0.04,
                              right: sizes.width * 0.04,
                            ),
                            height: sizes.height * 0.27,
                            width: sizes.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                              Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  //height: sizes.height * 0.1,
                                  // color: AppColors.greenBoxColor,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(height: sizes.heightRatio * 5),
                                        TextView.getExtraLargeText(heading, Assets.poppinsBold, color: AppColors.blackColor, lines: 1),
                                        SizedBox(height: sizes.heightRatio * 10),
                                        TextView.getMediumTextlight(
                                            subHeading, Assets.poppinsRegular, color: AppColors.blackColor, lines: 3,
                                            textAlign: TextAlign.center
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //SizedBox(height: sizes.height * 0.01),
                                CommonWidgets.getBottomButton(text: "Ok",
                                    onPress: onPressOk,
                                  width: sizes.width,
                                  margin: sizes.width * 0.001
                                ),
                                SizedBox(height: sizes.height * 0.01),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),)
              ,
            );
          },
        )
      },
    };
  }

}