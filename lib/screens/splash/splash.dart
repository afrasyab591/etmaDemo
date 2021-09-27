import 'package:etma_demo/res/assets.dart';
import 'package:etma_demo/res/colors.dart';
import 'package:etma_demo/res/res.dart';
import 'package:etma_demo/res/sizes.dart';
import 'package:etma_demo/screens/splash/splash_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  SplashProvider _splashProvider;
  @override
  void initState() {
    super.initState();
    _splashProvider = Provider.of<SplashProvider>(context, listen: false);
    _splashProvider.init(context: context);
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<SplashProvider>(context, listen: true);
    initializeResources(context: context);
    AppSizes().initializeSize(context);
    return SafeArea(
      child: Container(
        height: sizes.height,
        width: sizes.width,
        color: AppColors.whiteColor,
        child: Center(
            child:
            Container(
                width: sizes.width*0.8,
                height: sizes.height*0.5,
                child: Image(image: AssetImage(Assets.splash))))
      ),
    );
  }
}
