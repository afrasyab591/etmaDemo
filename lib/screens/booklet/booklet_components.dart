import 'package:etma_demo/animations/slide_right.dart';
import 'package:etma_demo/res/assets.dart';
import 'package:etma_demo/res/colors.dart';
import 'package:etma_demo/res/res.dart';
import 'package:etma_demo/screens/PendingBooklet/pendingBooklet.dart';
import 'package:etma_demo/screens/PendingTasks/PendingTasks.dart';
import 'package:etma_demo/screens/welcome/welcome_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import 'booklet.dart';

class BookletComponents {
  static bool isUser = false;
  String version;
  Widget getNavigationDrawer(BuildContext context, ){
    // PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
    //   String appName = packageInfo.appName;
    //   String packageName = packageInfo.packageName;
    //   version = packageInfo.version;
    //   print("version" + version);
    // });
    version=Provider.of<WelcomeProvider>(context, listen: false).version;
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      elevation: 24,
      child: Container(
        color: AppColors.headerBackground,
        width: sizes.width * 0.2,
        child: Column(
          // Important: Remove any padding from the ListView.
          // padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.headerBackground,
              ),
              child: _drawerHeader(),
              padding: EdgeInsets.only(top: sizes.topPadding *2),
            ),
            isUser? Container():
            GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, SlideRightRoute(page: Booklet()),(r)=> false);
                },
                child: Container(
                    height: sizes.height * 0.035,
                    width: sizes.width * 0.7,
                    child: _menuBodyItem(Assets.todo, "BOOKLET"))),
            isUser ? Container():
            SizedBox(height: sizes.mediumPadding*1.5),
            isUser ?
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(context, SlideRightRoute(page: PendingTasks()),(r)=> false);
              },
                child: Container(
                    height: sizes.height * 0.035,
                    width: sizes.width * 0.7,
                    child: _menuBodyItem(Assets.taskIcon, "Task"))): Container(),
            isUser ?
            SizedBox(height: sizes.mediumPadding*1.5): Container(),
            isUser ?
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(context, SlideRightRoute(page: PendingBooklet()),(r)=> false);
              },
                child: Container(
                    height: sizes.height * 0.035,
                    width: sizes.width * 0.7,
                    child: _menuBodyItem(Assets.todo, "BOOKLET"))): Container(),
            isUser ?
            SizedBox(height: sizes.mediumPadding*1.5): Container(),
            GestureDetector(
              onTap: () {

              },
                child: Container(
                    height: sizes.height * 0.03,
                    width: sizes.width * 0.7,
                    padding: EdgeInsets.only(left: sizes.smallPadding *0.5),
                    child: _menuBodyItem(Assets.logout, "LOG OUT"))),
            Spacer(),
            Container(
              padding: EdgeInsets.only(left: sizes.mediumPadding),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Switch to ${BookletComponents.isUser ? "User": "Supervisor" }", style: TextStyle(color: Colors.white,fontSize: sizes.regularFontSize, fontFamily: Assets.poppinsMedium),),
                  isUser ?
                  SizedBox(width: sizes.largePadding,): SizedBox(width: sizes.smallPadding,),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(value: isUser, onChanged: (value){
                      BookletComponents.isUser = value;
                      if (isUser) {
                        Navigator.pop(context);
                        Navigator.pushAndRemoveUntil(context, SlideRightRoute(page: PendingTasks()),(r)=> false);
                      }
                      else{
                        Navigator.pop(context);
                        Navigator.pushAndRemoveUntil(context, SlideRightRoute(page: Booklet()),(r)=> false);
                      }
                    },

                      activeColor: Colors.green,
                      trackColor: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            //SizedBox(height: sizes.largePadding,),
            Divider(height: 30, thickness: 0.2, color: AppColors.whiteColor,),
            Container(
                margin: EdgeInsets.only(left: sizes.mediumPadding),
              alignment: Alignment.bottomLeft,
                child: Text("V " + version, style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: Assets.poppinsRegular),)),
            SizedBox(height: sizes.mediumPadding,)

          ],
        ),
      ),
    );
  }

  Widget _drawerHeader(){
    return ListTile(
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child:
          Image.network("https://static.vecteezy.com/system/resources/thumbnails/002/083/570/small/indian-man-cartoon-with-beard-profile-picture-vector.jpg")),
      title: Text("John Doe",style: TextStyle(color: Colors.white, fontFamily: Assets.poppinsSemiBold),),
      subtitle: Text( isUser ? "Department - Supervisor": "Department - User",style: TextStyle(color: Colors.white, fontFamily: Assets.poppinsRegular)),
    );
  }
  Widget _menuBodyItem(String assetIcon, String title){
    return Container(
      margin: EdgeInsets.only(left: sizes.mediumPadding),
      child: Row(
        children: [
          Image.asset(assetIcon, height: 40, width: 40,),
          SizedBox(width: sizes.smallPadding,),
          Text(title, style: TextStyle(color: Colors.white,fontSize: sizes.mediumFontSize, fontFamily: Assets.poppinsRegular),)
        ],
      ),
    );
  }

}