import 'package:dio/dio.dart';
import 'package:etma_demo/models/GetBookletDetailForUserNew.dart';
import 'package:etma_demo/network/api_urls.dart';
import 'package:etma_demo/screens/utilities/toast.dart';
import 'package:etma_demo/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';

class BookletDetailProvider extends ChangeNotifier{
  BuildContext context;
  bool isDataFetch;
  bool isSubmitted = false;

  init({@required BuildContext context}){
    isDataFetch = false;
    isSubmitted = false;
    this.context = context;
  }

  Dio dio = Dio();


  GetBookletDetailForUserNew obj=GetBookletDetailForUserNew();

  Future<GetBookletDetailForUserNew> getBookletDetails({@required int bookletId}) async{
    String userId = CommonWidgets.userId;
    Response response = await dio.post(GetBookletDetailForUserApi, data: {
      "bookletId": bookletId,
      "userId": '$userId'
    });
    if(response.statusCode == 200){
      obj=GetBookletDetailForUserNew.fromJson(response.data);
      isDataFetch = true;
      // isSubmitted = obj.data.submitted;
      // notifyListeners();
      //print(obj.data.submitted);
      print(isSubmitted);
      // obj.data.submitted = true;
      return obj;


    }
    else{
      ApplicationToast.getSuccessToast(durationTime: 3, heading: "Error", subHeading: "error: " + response.data);
      return null;
    }
  }
}

