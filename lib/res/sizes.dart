import 'package:flutter/material.dart';

class AppSizes {
  Size _screenSize;
  bool isPhone;
  double width;
  double height;
  double topPadding;

  //For dynamic Sizing
  double widthRatio;
  double heightRatio;
  double fontRatio;

  //Dynamic Font Sizes
  double extraSmallFontSize;
  double smallFontSize;
  double mediumFontSize;
  double regularFontSize;
  double regularFontSize13;
  double largeFontSize;
  double extraLargeFontSize;
  double jumboFontSize;

  //padding
  double smallPadding;
  double regularPadding;
  double mediumPadding;
  double pagePadding;
  double largePadding;
  double extraLargePadding;
  double largerPadding;

  //tablet specific padding
  double tabletInnerPadding;
  double tabletOuterPadding;
  double tabletPagePadding;
  double tabletLargeOuterMargin;
  double tabletExtraLargeOuterMargin;
  double tabletSocialMediaPadding;
  double tabletAuthCommentPadding;

  void initializeSize(context) {
    _screenSize = MediaQuery.of(context).size;
    topPadding = MediaQuery.of(context).padding.top;
    width = _screenSize.shortestSide;
    height = _screenSize.longestSide;
    isPhone = _screenSize.shortestSide < 600;
    fontRatio =
    (isPhone && _screenSize.width <= 360) ? _screenSize.width / 360 : 1.0;
    widthRatio = isPhone ? _screenSize.width / 360 : _screenSize.width / 900;
    heightRatio =
    isPhone ? _screenSize.height / 720 : _screenSize.height / 1200;
    extraSmallFontSize = 10.0 * fontRatio;
    smallFontSize = 12.0 * fontRatio; // 11 px w400
    regularFontSize = 14.0 * fontRatio; //13 px w600
    regularFontSize13 = 13.0 * fontRatio; //13 px w600
    mediumFontSize = 16.0 * fontRatio; // 17 px w600, // 17 px w400
    largeFontSize = 18.0 * fontRatio; // 22 px
    extraLargeFontSize = 26.0 * fontRatio; //26 px
    jumboFontSize = 32.0 * fontRatio; // 40px

    smallPadding = 4.0 * widthRatio;
    regularPadding = 8.0 * widthRatio;
    mediumPadding = 12.0 * widthRatio;
    pagePadding = 16.0 * widthRatio;
    largePadding = 24.0 * widthRatio;
    extraLargePadding = 32.0 * widthRatio;
    largerPadding = 32.0 * widthRatio;

    tabletOuterPadding = 144.0 * widthRatio;
    tabletInnerPadding = 76.0 * widthRatio;
    tabletPagePadding = 48.0 * widthRatio;
    tabletExtraLargeOuterMargin = 228.0 * widthRatio;
    tabletLargeOuterMargin = 172.0 * widthRatio;
    tabletSocialMediaPadding = 192.0 * widthRatio;
    tabletAuthCommentPadding = 99.0 * widthRatio;
  }

  void refreshSize(context) {
    _screenSize = MediaQuery.of(context).size;
    width = _screenSize.width;
    height = _screenSize.height;
  }
}