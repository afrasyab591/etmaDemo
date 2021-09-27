import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';

class WelcomeProvider extends ChangeNotifier{
  BuildContext context;
  String version;

  init({@required BuildContext context}){
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      String appName = packageInfo.appName;
      String packageName = packageInfo.packageName;
      version = packageInfo.version;
      //notifyListeners();
      print("version" + version);
      this.context = context;
    });
    this.context = context;
  }
}

