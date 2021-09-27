
import 'package:etma_demo/animations/slide_right.dart';
import 'package:etma_demo/commons/utils.dart';
import 'package:etma_demo/screens/welcome/welcome.dart';
import 'package:flutter/cupertino.dart';


class SplashProvider extends ChangeNotifier{
  BuildContext context;

  init({@required BuildContext context}) async{
    this.context = context;
    PreferenceUtils.init();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    await Future.delayed(Duration(
      seconds: 4,
    ));
    bool userType = PreferenceUtils.getPosterUser();
    Navigator.pushReplacement(context, SlideRightRoute(page: Welcome()));

  }
}