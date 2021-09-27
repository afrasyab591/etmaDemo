import 'package:etma_demo/animations/slide_right.dart';
import 'package:etma_demo/models/api_models/get_booklets_for_supervisor_response.dart';
import 'package:etma_demo/res/assets.dart';
import 'package:etma_demo/res/colors.dart';
import 'package:etma_demo/res/res.dart';
import 'package:etma_demo/res/strings.dart';
import 'package:etma_demo/screens/PendingBooklet/pendingBookletComponents.dart';
import 'package:etma_demo/screens/PendingBooklet/pendingBookletProvider.dart';
import 'package:etma_demo/screens/booklet/booklet_components.dart';
import 'package:etma_demo/screens/utilities/toast.dart';
import 'package:etma_demo/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class PendingBooklet extends StatefulWidget {
  const PendingBooklet({Key key}) : super(key: key);
  static setBool(GetBookletsForSupervisorResponse response) {

    if(response.data.isEmpty){
      _PendingBookletState.selectedBooklet.clear();
    }

    for (Data data in response.data) {
      _PendingBookletState.selectedBooklet[data.userBookletId.toString()] = false;
    }
  }

  @override
  _PendingBookletState createState() => _PendingBookletState();
}

class _PendingBookletState extends State<PendingBooklet> {
  BookletComponents _bookletComponents = BookletComponents();
  PendingBookletComponents _components = PendingBookletComponents();
  PendingBookletProvider _pendingBookletProvider;
  static Map <String, bool> selectedBooklet = Map();
  bool check = false;
  bool selectAll = false;

  @override
  void initState() {
    super.initState();
    _pendingBookletProvider = Provider.of<PendingBookletProvider>(context, listen: false);
    _pendingBookletProvider.init(context: context);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PendingBookletProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Text(
                  "Booklet Approval",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18, fontFamily: Assets.poppinsSemiBold),
                ),
                Spacer(),
                GestureDetector(
                    onTap: (){
                      if (selectAll == false) {
                        setState(() {
                          selectAll = true;
                        });

                        if(selectedBooklet.length !=0){
                          for (String id in selectedBooklet.keys) {
                            _PendingBookletState.selectedBooklet[id] = true;
                          }
                        }
                      }
                      else {
                        setState(() {
                          selectAll = false;
                        });
                        if(selectedBooklet.length !=0){
                          for (String id in selectedBooklet.keys) {
                            _PendingBookletState.selectedBooklet[id] = false;
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
                      //Navigator.push(context, SlideRightRoute(page: BookletFilter()));
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
            child: RefreshIndicator(
              color: AppColors.blueTextColor,
              onRefresh: () => onRefresh(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CommonWidgets.getAppBarArrow(
                  //   text: Strings.bookletText,
                  //   onPress: () {},
                  // ),
                  SizedBox(height: sizes.heightRatio * 10),
                  _pendingBookletProvider.isClear ?
                  _components.getClearFilter(filterText: "Clear Filter",
                      onPressClearFilter: () {
                        _pendingBookletProvider.getBooklets(context: context, bookletName: "", date: "", isFilter: false, refresh: false);
                      }
                  ): Container(),
                  _pendingBookletProvider.isClear ?
                  SizedBox(height: sizes.heightRatio * 20): SizedBox(height: sizes.heightRatio * 30),
                  Expanded(
                    child: _pendingBookletProvider.isDataFetched?
                    _pendingBookletProvider.bookletList.length>0?
                    ListView.builder(
                        itemCount: _pendingBookletProvider.bookletList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding:
                            EdgeInsets.symmetric(horizontal: sizes.width * 0.06),
                            child: Column(
                              children: [
                                _components.getTaskContainer(onPress: () {
                                  setState(() {
                                    selectedBooklet[_pendingBookletProvider.bookletList[index].userBookletId.toString()]
                                    = ! selectedBooklet[_pendingBookletProvider.bookletList[index].userBookletId.toString()];
                                  });
                                },
                                    onPressArrow: () {
                                    },
                                    title: _pendingBookletProvider.bookletList[index].name,
                                    category: _pendingBookletProvider.bookletList[index].category,
                                    date: _pendingBookletProvider.bookletList[index].submittedDate,
                                    worker: _pendingBookletProvider.bookletList[index].submittedBy,
                                    isSelected: selectedBooklet[_pendingBookletProvider.bookletList[index].userBookletId.toString()]),
                              ],
                            ),
                          );
                        }
                    ):
                    ListView(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(vertical: sizes.height * 0.3),
                            child: CommonWidgets.onNullData(text: Strings.noBooklets)
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
                  SizedBox(height: sizes.heightRatio * 10),
                  _getSelectedBooklets(selectedBooklet).length > 0?
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
                                  _pendingBookletProvider.rejectTask(context: context, selected: _getSelectedBooklets(selectedBooklet));
                                  setState(() {
                                    selectedBooklet.clear();
                                  });
                                },
                                heading: Strings.sureText,
                                subHeading: _getSelectedBooklets(selectedBooklet).length == 1 ? Strings.sureRejectBookletText: Strings.sureRejectBookletMore);
                          },
                          width: sizes.width / 2.5, margin: sizes.smallPadding),
                      CommonWidgets.getBottomButton(text: "Approve",
                          onPress: (){
                            ApplicationToast.getAcceptOrRejectPopUp(context: context,
                                onCancel: () {
                                  Navigator.pop(context);
                                },
                                onOk: (){
                                  _pendingBookletProvider.approveTask(context: context, selected: _getSelectedBooklets(selectedBooklet));
                                  setState(() {
                                    selectedBooklet.clear();
                                  });
                                },
                                heading: Strings.sureText,
                                subHeading: _getSelectedBooklets(selectedBooklet).length == 1 ? Strings.sureAcceptBookletText: Strings.sureAcceptBookletMore);
                          },
                          width: sizes.width / 2.5, margin: sizes.smallPadding),
                    ],
                  ): Container(),
                  SizedBox(height: sizes.heightRatio * 20)
                ],
              ),
            ),

          ),
        ));
  }
  List <String> _getSelectedBooklets(Map<String, bool> map) {
    List <String> temporaryList = [];
    for(String id in map.keys) {
      if(map[id] ) {
        temporaryList.add(id);
      }
    }
    return temporaryList;
  }
  Future<Null> onRefresh() async{
    await _pendingBookletProvider.getBooklets(context: context, bookletName: "", date: "", isFilter: false, refresh: true);
  }
}
