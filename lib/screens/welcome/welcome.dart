import 'package:etma_demo/animations/slide_right.dart';
import 'package:etma_demo/res/assets.dart';
import 'package:etma_demo/res/colors.dart';
import 'package:etma_demo/res/res.dart';
import 'package:etma_demo/res/strings.dart';
import 'package:etma_demo/screens/booklet/booklet.dart';
import 'package:etma_demo/screens/welcome/welcome_components.dart';
import 'package:etma_demo/screens/welcome/welcome_provider.dart';
import 'package:etma_demo/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  WelcomeComponents _welcomeComponents;
  WelcomeProvider _welcomeProvider;

  @override
  void initState() {
    super.initState();
    _welcomeComponents = WelcomeComponents();
    _welcomeProvider = Provider.of<WelcomeProvider>(context, listen: false);
    _welcomeProvider.init(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: sizes.height,
        width: sizes.width,
        color: AppColors.whiteColor,
        padding: EdgeInsets.symmetric(horizontal: sizes.pagePadding),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: sizes.heightRatio * 100),
              Center(
                  child: CommonWidgets.getPNGPicture(
                height: sizes.height * 0.35,
                width: sizes.width * 0.85,
                image: Assets.welcome,
              )),
              SizedBox(height: sizes.heightRatio * 20),
              _welcomeComponents.getPremiumTextBox(
                  heading: Strings.welcomeText,
                  subHeading: Strings.welcomeDetailText),
            ],
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: sizes.heightRatio * 70,
              child: CommonWidgets.getMicrosoftButton(
                  text: Strings.logInText, onPress: () async {
                    Navigator.pushReplacement(context, SlideRightRoute(page: Booklet()));
              }))
        ]),
      ),
    ));
  }
}
