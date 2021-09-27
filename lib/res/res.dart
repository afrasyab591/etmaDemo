import 'package:flutter/cupertino.dart';

import 'colors.dart';
import 'sizes.dart';

AppColors colors;
AppSizes sizes;

bool _isInitialized = false;

void initializeResources({BuildContext context}) {
  AppSizes().initializeSize(context);
  if (_isInitialized) {
    /**
     * this is to prevent
     * multiple initialization calls.
     */
    return;
  }

  sizes = AppSizes()..initializeSize(context);
}
