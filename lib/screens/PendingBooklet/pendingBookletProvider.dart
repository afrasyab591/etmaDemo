import 'package:etma_demo/animations/slide_right.dart';
import 'package:etma_demo/generic_decode_encode/generic.dart';
import 'package:etma_demo/models/api_models/approve_booklet_by_supervisor_response.dart';
import 'package:etma_demo/models/api_models/get_booklets_for_supervisor_response.dart';
import 'package:etma_demo/network/api_urls.dart';
import 'package:etma_demo/network/network_helper.dart';
import 'package:etma_demo/network/network_helper_impl.dart';
import 'package:etma_demo/res/strings.dart';
import 'package:etma_demo/screens/PendingBooklet/pendingBooklet.dart';
import 'package:etma_demo/screens/utilities/toast.dart';
import 'package:etma_demo/widgets/common_widgets.dart';
import 'package:etma_demo/widgets/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

class PendingBookletProvider extends ChangeNotifier{
  BuildContext context;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  GetBookletsForSupervisorResponse getBookletsForSupervisor = GetBookletsForSupervisorResponse.empty();
  ApproveBookletBySupervisorResponse _approveBookletBySupervisorResponse = ApproveBookletBySupervisorResponse.empty();
  CustomPopup _loader = CustomPopup();
  var connectivity;
  bool isDataFetched = false;
  bool isDataFetched2 = false;
  bool isDataFetched3 = false;
  List<dynamic> bookletList = [];
  bool isClear = false;
  String supervisorId;

  init({@required BuildContext context}){
    connectivity = "";
    isDataFetched = false;
    isDataFetched2 = false;
    isDataFetched3 = false;
    bookletList = [];
    isClear = false;
    supervisorId =  CommonWidgets.supervisorId;
    this.context = context;
    getBooklets(context: context, bookletName: "", date: "", isFilter: false, refresh: false);
  }

  Future getBooklets({
    @required BuildContext context,
    @required String bookletName,
    @required String date,
    @required bool isFilter,
    @required bool refresh
  }) async {
    try {
      connectivity = await Connectivity().checkConnectivity();
      if (connectivity == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      }
      else {
        refresh == false ? _loader.showLoader(context: context): Container();
        http.Response response = await _networkHelper.post(
            getBookletsForSupervisorApi,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': ""},
            body: {
              "supervisorId": '$supervisorId',
              "name": bookletName,
              "date": date == "null"? "": date,
            }
        );
        if (response.statusCode == 200) {
          getBookletsForSupervisor = GetBookletsForSupervisorResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if (getBookletsForSupervisor.code == 1) {
            if(isFilter == true) {
              bookletList = getBookletsForSupervisor.data;
              isClear = true;
              isDataFetched = true;
              notifyListeners();
              PendingBooklet .setBool(getBookletsForSupervisor);
              Navigator.pop(context);
              refresh == false ? _loader.hideLoader(context): Container();
            }
            else{
              isClear = false;
              bookletList = getBookletsForSupervisor.data;
              isDataFetched = true;
              notifyListeners();
              PendingBooklet .setBool(getBookletsForSupervisor);
              refresh == false ? _loader.hideLoader(context): Container();
            }

          }

          else {
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: getBookletsForSupervisor.message);
          }
        } else {
          ApplicationToast.getErrorToast(
              durationTime: 3,
              heading: Strings.error,
              subHeading: Strings.somethingWentWrong);
        }
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Future approveTask({@required BuildContext context, @required List<String> selected
  }) async {
    try {
      connectivity = await Connectivity().checkConnectivity();
      if (connectivity == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      }
      else if (selected.isEmpty) {
        ApplicationToast.getErrorToast(durationTime: 3,
            heading: Strings.error, subHeading: Strings.selectBooklets);
      }
      else {
        _loader.showLoader(context: context);
        http.Response response = await _networkHelper.post(
            approveBookletBySupervisorApi,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': ""},
            body: {
              "id": selected,
              "approvedBy": '$supervisorId'
            }
        );
        if (response.statusCode == 200) {
          _approveBookletBySupervisorResponse = ApproveBookletBySupervisorResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if (_approveBookletBySupervisorResponse.code == 1) {
            print('Booklet Approved');
            isDataFetched2 = true;
            notifyListeners();
            //PendingBooklet .setBool(getBookletsForSupervisor);
            _loader.hideLoader(context);
            ApplicationToast.getSuccessToast(durationTime: 3, heading: Strings.success, subHeading: _approveBookletBySupervisorResponse.data.message);
            Navigator.push(context, SlideRightRoute(page: PendingBooklet()));
          }

          else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: _approveBookletBySupervisorResponse.message);
          }
        } else {
          _loader.hideLoader(context);
          ApplicationToast.getErrorToast(
              durationTime: 3,
              heading: Strings.error,
              subHeading: Strings.somethingWentWrong);
        }
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Future rejectTask({@required BuildContext context, @required List<String> selected
  }) async {
    try {
      connectivity = await Connectivity().checkConnectivity();
      if (connectivity == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      }
      else if (selected.isEmpty) {
        ApplicationToast.getErrorToast(durationTime: 3,
            heading: Strings.error, subHeading: Strings.selectBooklets);
      }

      else {
        _loader.showLoader(context: context);
        http.Response response = await _networkHelper.post(
            rejectBookletBySupervisorApi,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': ""},
            body: {
              "id": selected,
              "rejectedBy": '$supervisorId'
            }
        );
        if (response.statusCode == 200) {
          _approveBookletBySupervisorResponse = ApproveBookletBySupervisorResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if (_approveBookletBySupervisorResponse.code == 1) {
            print('Booklet Rejected');
            isDataFetched3 = true;
            notifyListeners();
            //PendingBooklet .setBool(getBookletsForSupervisor);
            _loader.hideLoader(context);
            ApplicationToast.getSuccessToast(durationTime: 3, heading: Strings.success, subHeading: _approveBookletBySupervisorResponse.data.message);
            Navigator.push(context, SlideRightRoute(page: PendingBooklet()));
          }

          else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: _approveBookletBySupervisorResponse.message);
          }
        } else {
          _loader.hideLoader(context);
          ApplicationToast.getErrorToast(
              durationTime: 3,
              heading: Strings.error,
              subHeading: Strings.somethingWentWrong);
        }
      }
    } catch (error) {
      print(error.toString());
    }
  }
}

