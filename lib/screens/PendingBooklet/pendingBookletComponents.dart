import 'package:date_time_format/date_time_format.dart';
import 'package:etma_demo/res/colors.dart';
import 'package:etma_demo/res/res.dart';
import 'package:etma_demo/widgets/text_views.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PendingBookletComponents{

  Widget getTaskContainer({
    @required Function onPress,
    @required Function onPressArrow,
    @required String title,
    @required String category,
    @required String date,
    @required String worker,
    @required bool isSelected
  }){
    return GestureDetector(
      onTap: () => onPress(),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(shape: BoxShape.circle,
                  color: isSelected ?  Colors.green : Colors.white,
                  border: isSelected ? Border.all(color: AppColors.whiteColor): Border.all(color: AppColors.blackColor.withOpacity(0.6)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: isSelected
                    ? Icon(
                  Icons.check,
                  size: 14.0,
                  color: Colors.white,
                )
                    : Icon(
                  Icons.check,
                  size: 14.0,
                  color: Colors.white
                ),
              )),
          SizedBox(width: sizes.mediumPadding,),
          Expanded(
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () => onPressArrow(),
                  child: Container(
                    height: sizes.height * 0.19,
                    width: sizes.width,
                    margin: EdgeInsets.only(bottom: sizes.largePadding),
                    decoration: BoxDecoration(
                        color: AppColors.lightGreyBoxColor,
                        //border: Border.all(color: AppColors.borderColor.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[500].withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 0))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.arrow_right,
                          size: 25.0,
                          color: AppColors.blueBoxColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                //height: sizes.height * 0.19,
                width: sizes.width * .73,
                padding: EdgeInsets.only(top:sizes.largePadding,bottom: sizes.largePadding),
                margin: EdgeInsets.only(bottom: sizes.largePadding),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: sizes.largePadding,right: sizes.largePadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // TextView.getMediumText(title, color: AppColors.blackColor, lines: 1),
                          Container(
                              width: sizes.width * 0.5,
                              child: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black,fontSize: sizes.regularFontSize),)),
                          //Text('${DateTimeFormat.format(DateTime.parse(date), format: 'j M, Y')}', style: TextStyle(fontSize: sizes.regularFontSize),)
                        ],
                      ),
                    ),
                    SizedBox(height: sizes.mediumPadding,),
                    Container(
                        width: sizes.width * 0.65,
                        padding: EdgeInsets.only(left: sizes.largePadding,right: sizes.largePadding),
                        child: Text(category, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sizes.regularFontSize),)),
                    SizedBox(height: sizes.mediumPadding,),
                    SizedBox(height: 2,child: Container(color: Colors.grey.withOpacity(.3),),),
                    SizedBox(height: sizes.mediumPadding,),
                    Container(
                        padding: EdgeInsets.only(left: sizes.largePadding,right: sizes.largePadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: sizes.width * 0.35,
                                child: Text(worker, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: sizes.regularFontSize),)),
                            Text('${DateTimeFormat.format(DateTime.parse(date), format: 'j M, Y')}', style: TextStyle(fontSize: sizes.regularFontSize),)
                          ],
                        )),

                  ],
                ),
              ),

              ]
            ),
          ),
        ],
      ),
    );
  }
  Widget getClearFilter({@required String filterText, @required Function onPressClearFilter}) {
    return GestureDetector(
      onTap: () => onPressClearFilter(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: sizes.width * 0.15),
        // height: sizes.height * 0.05,
        // width: sizes.width * 0.4,
        child: TextView.getRegularTextHeavy(filterText, color: AppColors.redColor, lines: 1),
      ),
    );
  }
}