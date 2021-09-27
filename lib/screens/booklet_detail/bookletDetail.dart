import 'package:etma_demo/animations/slide_right.dart';
import 'package:etma_demo/res/assets.dart';
import 'package:etma_demo/res/colors.dart';
import 'package:etma_demo/res/res.dart';
import 'package:etma_demo/res/strings.dart';
import 'package:etma_demo/widgets/common_widgets.dart';
import 'package:etma_demo/widgets/text_views.dart';
import 'package:etma_demo/models/GetBookletDetailForUserNew.dart' as newUsers;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'bookletDetail_components.dart';
import 'bookletDetail_provider.dart';

class BookletDetail extends StatefulWidget {
  final String bookletName, bookletType, qualificationType, version;
  final int userBookletId, id;
  final bool isDirectApprove;
  BookletDetail({
    @required this.bookletName,
    @required this.userBookletId,
    @required this.id,
    @required this.bookletType,
    @required this.isDirectApprove,
    @required this.qualificationType,
    @required this.version
  });

  @override
  _BookletDetailState createState() => _BookletDetailState();
}

class _BookletDetailState extends State<BookletDetail> {
  BookletDetailComponents _bookletDetailComponents;
  BookletDetailProvider _provider = BookletDetailProvider();
  bool _isSubmitAvailable=false;
  bool _canSubmit=false;
  bool  _isHundred = false;
  var _myFuture;
  List <String> names=[];

  int added=0;

  @override
  void initState() {
    super.initState();
    _bookletDetailComponents = BookletDetailComponents();
    // _provider = Provider.of<BookletDetailProvider>(context, listen: false);
    // _provider.init(context: context);
    _myFuture = _provider.getBookletDetails(bookletId: widget.id);
  }



  @override
  Widget build(BuildContext context) {
    // Provider.of<BookletDetailProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: sizes.height,
            width: sizes.width,
            color: AppColors.whiteColor,
            //padding: EdgeInsets.symmetric(horizontal: sizes.pagePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidgets.getAppBarArrowSubmit(
                    text: widget.bookletName,
                    onPress: () {
                      Navigator.pop(context);
                      },
                    //isShow: true,

                    isShow: (/*_isSubmitAvailable && */_canSubmit /*&& _isHundred*/),
                    onPressSubmit: () {

                    }
                ),
                SizedBox(height: sizes.heightRatio * 40),
                Expanded(
                  child: FutureBuilder(
                      future: _myFuture,
                      builder: (context,
                          AsyncSnapshot<newUsers.GetBookletDetailForUserNew> bookletSnapshot) {
                        if(bookletSnapshot.hasData){
                          if (bookletSnapshot.data.data.canSubmit /*&& (bookletSnapshot.data.data.completion == 100.0)*/) {
                            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                              setState(() {
                                _canSubmit = true;
                              });
                            });
                          }
                          if (bookletSnapshot.data.data.submitted == false /*&& (bookletSnapshot.data.data.completion == 100.0)*/) {
                            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                              setState(() {
                                _isSubmitAvailable = true;
                              });

                            });
                          }
                          if (bookletSnapshot.data.data.completion == 100.0) {
                            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                              setState(() {
                                _isHundred = true;
                              });

                            });
                          }
                          return Column(
                            children: [
                              Container(
                                margin:EdgeInsets.symmetric(horizontal: sizes.mediumPadding),
                                child: CommonWidgets.getBookletContainer(
                                    onPress: () {

                                    },
                                    bookletName: bookletSnapshot.data.data.name,
                                    type: widget.bookletType,
                                    isSubmit: bookletSnapshot.data.data.isApproved,
                                    completePercentage: (bookletSnapshot.data.data.completion / 100).toDouble(),
                                    boxColor: CommonWidgets.getColorFromRgb(bookletSnapshot.data.data.color),
                                    qualificationType: bookletSnapshot.data.data.qualificationType,
                                    version: bookletSnapshot.data.data.version
                                ),
                              ),
                              SizedBox(height: sizes.heightRatio * 20),

                              bookletSnapshot.data.data.categories.length == 0 ? Center(child: Text("No Categories Available"),) :Expanded(
                                child: Container(

                                  padding: EdgeInsets.all(sizes.width * 0.06),
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    border: Border.all(color: AppColors.borderColor),
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                                  ),
                                  child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        if(index == 0){
                                          return TextView.getLargeText(Strings.categoriesText, Assets.poppinsSemiBold, color: AppColors.blackColor, lines: 1);
                                        }
                                        else{
                                          added++;
                                          if(added==1){
                                            addNamesInList(bookletSnapshot.data.data.categories);
                                          }
                                          return _bookletDetailComponents.getCategoryBox(
                                              categoryTitle: bookletSnapshot.data.data.categories.elementAt(index -1).name,
                                              status: bookletSnapshot.data.data.categories.elementAt(index  -1 ).isCompleted ? "Completed" : "Incomplete",
                                              onPress: () {}
                                          );
                                        }
                                      },
                                      separatorBuilder: (ctx, i) => Divider(
                                        thickness: 0,
                                        color: Colors.transparent,
                                      ),
                                      itemCount: bookletSnapshot.data.data.categories.length +1),
                                ),
                              )

                            ],
                          );
                        }
                        else{
                          return Center(
                            child: Container(
                              height: sizes.height * 0.15,
                              child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
                            ),
                          );
                        }
                      }
                      ),
                ),
              ],
            ),
          ),
        ));
  }

  void addNamesInList(List <newUsers.Categories> names){
    for (int i=0; i< names.length; i++){
      this.names.add(names[i].name);

    }
  }


}
