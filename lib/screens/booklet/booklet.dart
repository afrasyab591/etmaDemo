import 'dart:math';
import 'package:etma_demo/animations/slide_right.dart';
import 'package:etma_demo/models/BookletModel.dart';
import 'package:etma_demo/res/assets.dart';
import 'package:etma_demo/res/colors.dart';
import 'package:etma_demo/res/res.dart';
import 'package:etma_demo/res/strings.dart';
import 'package:etma_demo/screens/booklet_detail/bookletDetail.dart';
import 'package:etma_demo/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'booklet_components.dart';
import 'booklet_provider.dart';


class Booklet extends StatefulWidget {
  @override
  _BookletState createState() => _BookletState();
}

class _BookletState extends State<Booklet> {
  BookletComponents _bookletComponents;
  BookletProvider _provider = BookletProvider();
  List<Color> iconColors = [
    AppColors.blueBoxColor,
    AppColors.yellowBoxColor,
    AppColors.orangeBoxColor,
    AppColors.greenBoxColor,
    AppColors.grayBoxColor,
  ];

  @override
  void initState() {
    super.initState();
    _bookletComponents = BookletComponents();
    _provider = Provider.of<BookletProvider>(context, listen: false);
    _provider.init(context: context);
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Booklet",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: Assets.poppinsSemiBold),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: sizes.heightRatio * 20),
            Expanded(
              child: RefreshIndicator(
                color: AppColors.blueTextColor,
                onRefresh: () => onRefresh(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: sizes.width * 0.06),
                  child: FutureBuilder(
                      future: _provider.getBooklets(),
                      builder: (context,
                          AsyncSnapshot<BookletModel> bookletSnapshot) =>
                      bookletSnapshot.hasData
                          ?bookletSnapshot.data.data.length == 0 ?
                      ListView(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(vertical: sizes.height * 0.3),
                              child: CommonWidgets.onNullData(text: Strings.noBooklets)
                          ),
                        ],
                      ) :
                      ListView.separated(
                          itemBuilder: (context, index) =>
                              CommonWidgets.getBookletContainer(
                                  onPress: () {
                                    print('=======================');
                                    print(bookletSnapshot.data.data.elementAt(index).submitted);
                                    print(bookletSnapshot.data.data.elementAt(index).isDirectApprove);
                                    Navigator.push(
                                        context,
                                        SlideRightRoute(
                                            page: BookletDetail(
                                              bookletName: bookletSnapshot.data.data.elementAt(index).name,
                                              userBookletId: bookletSnapshot.data.data.elementAt(index).userBookletId,
                                              id: bookletSnapshot.data.data.elementAt(index).id,
                                              bookletType: bookletSnapshot.data.data.elementAt(index).bookletType,
                                              isDirectApprove: bookletSnapshot.data.data.elementAt(index).isDirectApprove,
                                              qualificationType: bookletSnapshot.data.data.elementAt(index).qualificationType,
                                              version: bookletSnapshot.data.data.elementAt(index).version,
                                            )));
                                  },
                                  bookletName: bookletSnapshot.data.data.elementAt(index).name,
                                  version: bookletSnapshot.data.data.elementAt(index).version,
                                  type: bookletSnapshot.data.data.elementAt(index).bookletType,
                                  qualificationType: bookletSnapshot.data.data.elementAt(index).qualificationType,
                                  isSubmit: bookletSnapshot.data.data.elementAt(index).submitted,
                                  completePercentage: (bookletSnapshot.data.data.elementAt(index).completion/ 100).toDouble(),
                                  boxColor: CommonWidgets.getColorFromRgb(bookletSnapshot.data.data.elementAt(index).color)),
                          separatorBuilder: (ctx, i) => Divider(
                            thickness: 0,
                            color: Colors.transparent,
                          ),
                          itemCount: bookletSnapshot.data.data.length)
                          : Center(
                        child: Container(
                          height: sizes.height * 0.15,
                          child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
                        ),
                      )),
                ),
              )

            ),
            SizedBox(height: sizes.heightRatio * 10)
          ],
        ),
      ),
    ));
  }

  Color getRandomColor() => iconColors[Random().nextInt(iconColors.length)];
  Future<Null> onRefresh() async{
    await _provider.getBooklets().then((_) {
      setState(() {

      });
    });
  }
}
