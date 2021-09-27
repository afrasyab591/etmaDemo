
import 'package:etma_demo/res/res.dart';
import 'package:flutter/cupertino.dart';
import '../res/assets.dart';


class TextView {

  static Text getJumboText(final text,
      {@required final color, final TextAlign textAlign = TextAlign.start, @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes.jumboFontSize,
        fontWeight: FontWeight.w700,
        fontFamily: Assets.interMedium,
        color: color,
      ),
    );
  }
  static Text getExtraLargeText(final text, final fontFamily,
      {@required final color, final TextAlign textAlign = TextAlign.start, @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes.extraLargeFontSize,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }
  static Text getMediumText(final text, final fontFamily,
      {@required final color, final TextAlign textAlign = TextAlign.start, @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes.mediumFontSize,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }
  static Text getMediumTextlight(final text, final fontFamily,
      {@required final color, final TextAlign textAlign = TextAlign.start, @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes.mediumFontSize,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }
  static Text getSmallTextItalic(final text, final fontFamily,
      {@required final color, final TextAlign textAlign = TextAlign.start, @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes.regularFontSize13,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        //fontStyle: FontStyle.italic,
        color: color,
      ),
    );
  }
  static Text getLargeText(final text, final fontFamily,
      {@required final color, final TextAlign textAlign = TextAlign.start, @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes.largeFontSize,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }
  static Text getRegularText(final text, final fontFamily,
      {@required final color, final TextAlign textAlign = TextAlign.start, @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes.regularFontSize,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }
  static Text getRegularText13(final text, final fontFamily,
      {@required final color, final TextAlign textAlign = TextAlign.start, @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes.regularFontSize13,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }
  static Text getRegularTextUnderline(final text,
      {@required final color, final TextAlign textAlign = TextAlign.start, @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes.mediumFontSize,
        fontWeight: FontWeight.w400,
        fontFamily: Assets.interMedium,
        color: color,
        decoration: TextDecoration.underline
      ),
    );
  }
  static Text getRegularS17W600Text(final text,
      {@required final color, final TextAlign textAlign = TextAlign.start, @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes.mediumFontSize,
        fontWeight: FontWeight.w600,
        fontFamily: Assets.interMedium,
        color: color,
      ),
    );
  }
  static Text getRegularTextHeavy(final text,
      {@required final color, final TextAlign textAlign = TextAlign.start, @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes.mediumFontSize,
        fontWeight: FontWeight.w700,
        fontFamily: Assets.interMedium,
        color: color,
      ),
    );
  }
  static Text getSmallText(final text, final fontFamily,
      {@required final color, final TextAlign textAlign = TextAlign.start, @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes.smallFontSize,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getSmallTextCenterAlign(final text,
      {@required final color, final TextAlign textAlign = TextAlign.center, @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes.smallFontSize,
        fontWeight: FontWeight.w400,
        fontFamily: Assets.interMedium,
        color: color,
      ),
    );
  }
  static Text getExtraSmallText(final text, final fontFamily,
      {@required final color, final TextAlign textAlign = TextAlign.start, @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes.extraSmallFontSize,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }
  static Text getSmallTextHeavy(final text,
      {@required final color, final TextAlign textAlign = TextAlign.start, @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes.smallFontSize,
        fontWeight: FontWeight.w700,
        fontFamily: Assets.interMedium,
        color: color,
      ),
    );
  }
  static Text getRegular13Text(final text, final fontFamily,
      {@required final color, final TextAlign textAlign = TextAlign.center, @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes.regularFontSize,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }
  static Text getRegular13TextHeavy(final text,
      {@required final color, final TextAlign textAlign = TextAlign.start, @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes.regularFontSize,
        fontWeight: FontWeight.w900,
        fontFamily: Assets.interMedium,
        color: color,
      ),
    );
  }

  static Text getDropdownText(final text,
      {@required final color, final TextAlign textAlign = TextAlign.start, @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontFamily: Assets.interRegular,
        fontSize: sizes.mediumFontSize,
        color: color,
      ),
    );
  }
  static Text getDropdownHintText(final text, final fontFamily,
      {@required final color, final TextAlign textAlign = TextAlign.start, @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: sizes.regularFontSize,
          fontFamily: fontFamily,
          color: color
      ),
    );
  }
}