import 'package:dio/dio.dart';
import 'package:etma_demo/models/BookletModel.dart';
import 'package:etma_demo/network/api_urls.dart';
import 'package:etma_demo/screens/utilities/toast.dart';
import 'package:etma_demo/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';

class BookletProvider extends ChangeNotifier{
  BuildContext context;
  Dio dio = Dio();
  String version;

  init({@required BuildContext context}){
    // PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
    //   String appName = packageInfo.appName;
    //   String packageName = packageInfo.packageName;
    //   version = packageInfo.version;
    //   notifyListeners();
    //   print("version" + version);
    // });
    this.context = context;
  }

  Future<BookletModel> getBooklets() async{
    String userId = CommonWidgets.userId;
    Response response = await dio.post(GetBookletsForUserApi, data: {
      "userId": '$userId'
    });
    if(response.statusCode == 200){
      print('booklet Api Successful');

      BookletModel model=BookletModel.fromJson(response.data);
      notifyListeners();
      return model;
    }
    else{
      ApplicationToast.getSuccessToast(durationTime: 3, heading: "Error", subHeading: "error: " + response.data);
      return null;
    }
  }
}

