
import 'package:etma_demo/animations/slide_right.dart';
import 'package:etma_demo/models/api_models/get_tasks_for_supervisor_response_new.dart';
import 'package:etma_demo/res/assets.dart';
import 'package:etma_demo/res/colors.dart';
import 'package:etma_demo/res/res.dart';
import 'package:etma_demo/res/strings.dart';
import 'package:etma_demo/screens/Filter/Filter.dart';
import 'package:etma_demo/screens/booklet/booklet_components.dart';
import 'package:etma_demo/screens/utilities/toast.dart';
import 'package:etma_demo/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'PendingTasksComponents.dart';
import 'PendingTasksProvider.dart';

class PendingTasks extends StatefulWidget {
  const PendingTasks({Key key}) : super(key: key);
  static setBool(GetTasksForSupervisorResponseNew response) {
    if(response.data.isEmpty){
      _PendingTasksState.selectedTask.clear();
    }

    for (Data data in response.data) {
      _PendingTasksState.selectedTask[data.userTaskId.toString()] = false;
    }


  }

  @override
  _PendingTasksState createState() => _PendingTasksState();
}

class _PendingTasksState extends State<PendingTasks> {
  BookletComponents _bookletComponents = BookletComponents();
  PendingTasksComponents _components = PendingTasksComponents();
  PendingTasksProvider _pendingTasksProvider;
  static Map <String, bool> selectedTask = Map();
  bool check = false;
  bool selectAll = false;

  @override
  void initState() {
    super.initState();
    _pendingTasksProvider = Provider.of<PendingTasksProvider>(context, listen: false);
    _pendingTasksProvider.init(context: context);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PendingTasksProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Task Approval",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18, fontFamily: Assets.poppinsSemiBold),
            ),
            Spacer(),
            GestureDetector(
                onTap: (){

                  if (selectAll == false) {
                    setState(() {
                      selectAll = true;
                    });

                    if(selectedTask.length !=0){
                      for (String id in selectedTask.keys) {
                        _PendingTasksState.selectedTask[id] = true;
                      }
                    }
                  }
                  else {
                    setState(() {
                      selectAll = false;
                    });
                    if(selectedTask.length !=0){
                      for (String id in selectedTask.keys) {
                        _PendingTasksState.selectedTask[id] = false;
                      }
                    }
                  }
                },
                child: Container(
                    height: sizes.height * 0.035,
                    width: sizes.width * 0.06,
                    child: Image.asset(Assets.checkBox))),
            SizedBox(width: sizes.mediumPadding,),
            GestureDetector(
                onTap: (){
                  Navigator.push(context, SlideRightRoute(page: Filter()));
                },
                child: Container(
                    height: sizes.height * 0.035,
                    width: sizes.width * 0.06,
                    child: Image.asset(Assets.filter))),
          ],
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        primary: true,
        iconTheme: IconThemeData(color: Colors.black),
        toolbarHeight: sizes.height * .1,
      ),
      drawer: Container(
          height: sizes.height,
          width: sizes.width * 0.65,
          child: _bookletComponents.getNavigationDrawer(context)),
      body: Container(
        height: sizes.height,
        width: sizes.width,
        color: AppColors.whiteColor,
        //padding: EdgeInsets.symmetric(horizontal: sizes.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: sizes.heightRatio * 10),
            _pendingTasksProvider.isClear ?
            _components.getClearFilter(filterText: "Clear Filter",
                onPressClearFilter: () {
                  _pendingTasksProvider.getTasks(context: context, bookletName: "", date: "", isFilter: false, refresh: false);
                }
            ): Container(),
            _pendingTasksProvider.isClear ?
            SizedBox(height: sizes.heightRatio * 20): SizedBox(height: sizes.heightRatio * 30),
            Expanded(
              child: RefreshIndicator(
                color: AppColors.blueTextColor,
                onRefresh: () => onRefresh(),
                child: _pendingTasksProvider.isDataFetched?
                _pendingTasksProvider.taskList.length>0?
                ListView.builder(
                    itemCount: _pendingTasksProvider.taskList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: sizes.width * 0.06),
                        child: _components.getTaskContainer(onPress: () {
                          setState(() {
                            selectedTask[_pendingTasksProvider.taskList[index].userTaskId.toString()]
                            = !selectedTask[_pendingTasksProvider.taskList[index].userTaskId.toString()];
                          });
                        },
                            title: _pendingTasksProvider.taskList[index].taskName,
                            category: _pendingTasksProvider.taskList[index].category,
                            date: _pendingTasksProvider.taskList[index].submittedDate,
                            worker: _pendingTasksProvider.taskList[index].submittedBy,
                            isSelected: selectedTask[_pendingTasksProvider.taskList[index].userTaskId.toString()]),
                      );
                    }
                ):
                ListView(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(vertical: sizes.height * 0.3),
                        child: CommonWidgets.onNullData(text: Strings.noTasks)
                    ),
                  ],
                ):
                Center(
                  child: Container(
                    //height: sizes.height * 0.15,
                    //child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            SizedBox(height: sizes.heightRatio * 10),
            _getSelectedTasks(selectedTask).length > 0?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonWidgets.getEmptyBottomButton(text: "Reject",
                    onPress: (){
                  ApplicationToast.getAcceptOrRejectPopUp(
                      context: context,
                      onCancel: (){
                        Navigator.pop(context);
                      },
                      onOk: (){
                        _pendingTasksProvider.rejectTask(context: context, selected: _getSelectedTasks(selectedTask));
                        setState(() {
                          selectedTask.clear();
                        });
                        //ApplicationToast.getSuccessToast(durationTime: 3, heading: "", subHeading: ""+selectedTask.length.toString());
                      },
                      heading: Strings.sureText,
                      subHeading: _getSelectedTasks(selectedTask).length == 1 ? Strings.sureRejectTaskText: Strings.sureRejectTaskMore);
                    },
                    width: sizes.width / 2.5, margin: sizes.smallPadding),
                CommonWidgets.getBottomButton(text: "Approve",
                    onPress: (){
                  ApplicationToast.getAcceptOrRejectPopUp(context: context,
                      onCancel: () {
                        Navigator.pop(context);
                      },
                      onOk: (){
                        _pendingTasksProvider.approveTask(context: context, selected: _getSelectedTasks(selectedTask));
                     setState(() {
                       selectedTask.clear();
                     });
                      },
                      heading: Strings.sureText,
                      subHeading: _getSelectedTasks(selectedTask).length == 1 ? Strings.sureAcceptTaskText: Strings.sureAcceptTaskMore);
                    },width: sizes.width / 2.5, margin: sizes.smallPadding),
              ],
            ): Container(),
            SizedBox(height: sizes.heightRatio * 20)
          ],
        ),
      ),
    ));
  }
  List <String> _getSelectedTasks(Map<String, bool> map) {
    List <String> temporaryList = [];
    for(String id in map.keys) {
      if(map[id] ) {
        temporaryList.add(id);
      }
    }
    return temporaryList;
  }
  Future<Null> onRefresh() async{
    await _pendingTasksProvider.getTasks(context: context, bookletName: "", date: "", isFilter: false, refresh: true);
  }

}
