
import 'package:etma_demo/animations/slide_right.dart';
import 'package:etma_demo/generic_decode_encode/generic.dart';
import 'package:etma_demo/models/api_models/approve_task_by_supervisor_response.dart';
import 'package:etma_demo/models/api_models/get_tasks_for_supervisor_response_new.dart';
import 'package:etma_demo/network/api_urls.dart';
import 'package:etma_demo/network/network_helper.dart';
import 'package:etma_demo/network/network_helper_impl.dart';
import 'package:etma_demo/res/strings.dart';
import 'package:etma_demo/screens/utilities/toast.dart';
import 'package:etma_demo/widgets/common_widgets.dart';
import 'package:etma_demo/widgets/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:connectivity/connectivity.dart';

import 'package:http/http.dart' as http;

import 'PendingTasks.dart';

class PendingTasksProvider extends ChangeNotifier{
  BuildContext context;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  GetTasksForSupervisorResponseNew getTasksForSupervisorResponseNew = GetTasksForSupervisorResponseNew.empty();
  ApproveTaskBySupervisorResponse approveTaskBySupervisorResponse = ApproveTaskBySupervisorResponse.empty();
  CustomPopup _loader = CustomPopup();
  var connectivity;
  bool isDataFetched = false;
  bool isDataFetched2 = false;
  bool isDataFetched3 = false;
  List<dynamic> taskList = [];
  bool isClear = false;
  String supervisorId;

  init({@required BuildContext context}){
    connectivity = "";
    isDataFetched = false;
    isDataFetched2 = false;
    isDataFetched3 = false;
    taskList = [];
    isClear = false;
    supervisorId =  CommonWidgets.supervisorId;
    this.context = context;
    getTasks(context: context, bookletName: "", date: "", isFilter: false, refresh: false);
  }

  Future getTasks({
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
          getTasksForSupervisorApi,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': ""},
          body: {
            "supervisorId": '$supervisorId',
            "name": bookletName,
            "date": date == "null"? "": date,
            });
        if (response.statusCode == 200) {
          getTasksForSupervisorResponseNew = GetTasksForSupervisorResponseNew.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if (getTasksForSupervisorResponseNew.code == 1) {
            if(isFilter == true) {
              taskList = getTasksForSupervisorResponseNew.data;
              isClear = true;
              isDataFetched = true;
              notifyListeners();
              PendingTasks.setBool(getTasksForSupervisorResponseNew);
              Navigator.pop(context);
              refresh == false ? _loader.hideLoader(context): Container();
            }
            else{
              isClear = false;
              taskList = getTasksForSupervisorResponseNew.data;
              isDataFetched = true;
              notifyListeners();
              PendingTasks .setBool(getTasksForSupervisorResponseNew);
              refresh == false ? _loader.hideLoader(context): Container();
            }
          }

          else {
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: getTasksForSupervisorResponseNew.message);
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
            heading: Strings.error, subHeading: Strings.selectTasks);
      }
      else {
        _loader.showLoader(context: context);
        http.Response response = await _networkHelper.post(
            approveTaskBySupervisorApi,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': ""},
            body: {
              "id": selected,
              "approvedBy": '$supervisorId'
            }
        );
        if (response.statusCode == 200) {
          approveTaskBySupervisorResponse = ApproveTaskBySupervisorResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if (approveTaskBySupervisorResponse.code == 1) {
            print('Task Approved');
            isDataFetched2 = true;
            notifyListeners();
            _loader.hideLoader(context);
            ApplicationToast.getSuccessToast(durationTime: 3, heading: Strings.success, subHeading: approveTaskBySupervisorResponse.data.message);
            Navigator.push(context, SlideRightRoute(page: PendingTasks()));
          }

          else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: approveTaskBySupervisorResponse.message);
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
      _loader.hideLoader(context);
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
            heading: Strings.error, subHeading: Strings.selectTasks);
      }
      else {
        _loader.showLoader(context: context);
        http.Response response = await _networkHelper.post(
            RejectTaskBySupervisorApi,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': ""},
            body: {
              "id": selected,
              "rejectedBy": '$supervisorId'
            }
        );
        if (response.statusCode == 200) {
          approveTaskBySupervisorResponse = ApproveTaskBySupervisorResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if (approveTaskBySupervisorResponse.code == 1) {
            print('Task Rejected');
            isDataFetched3 = true;
            notifyListeners();
            _loader.hideLoader(context);
            ApplicationToast.getSuccessToast(durationTime: 3, heading: Strings.success, subHeading: approveTaskBySupervisorResponse.data.message);
            Navigator.push(context, SlideRightRoute(page: PendingTasks()));
          }

          else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: approveTaskBySupervisorResponse.message);
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
      _loader.hideLoader(context);
      print(error.toString());
    }
  }

}

