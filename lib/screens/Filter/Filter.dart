import 'package:etma_demo/res/assets.dart';
import 'package:etma_demo/res/colors.dart';
import 'package:etma_demo/res/res.dart';
import 'package:etma_demo/res/strings.dart';
import 'package:etma_demo/screens/PendingTasks/PendingTasksProvider.dart';
import 'package:etma_demo/screens/utilities/toast.dart';
import 'package:etma_demo/widgets/common_widgets.dart';
import 'package:etma_demo/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Filter extends StatefulWidget {
  const Filter({Key key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  TextEditingController _bookletName;
  PendingTasksProvider _pendingTasksProvider;
  DateTime filterDate;

  @override
  void initState() {
    super.initState();
    _bookletName = TextEditingController();
    //filterDate = DateTime.now();
    _pendingTasksProvider = Provider.of<PendingTasksProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PendingTasksProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            left: sizes.width * 0.06,
            right: sizes.width * 0.06,
            top: sizes.width * 0.2),
        color: AppColors.whiteColor,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Filters",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: sizes.extraLargeFontSize,
                      fontFamily: Assets.poppinsSemiBold
                  ),
                ),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: sizes.height * 0.04,
                        width: sizes.width * 0.08,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          border: Border.all(color: AppColors.lightBorderColor),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Image.asset(Assets.crossIcon)))
              ],
            ),
            SizedBox(
              height: sizes.extraLargePadding * 1,
            ),
            Expanded(
              child: ListView(

                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: sizes.extraLargePadding * 1,
                  ),
                  TextView.getRegularText("Booklet Name", Assets.poppinsRegular,
                      color: AppColors.blackColor, lines: 1),
                  SizedBox(height: sizes.heightRatio * 10),
                  CommonWidgets.getTextField(
                      isPassword: false,
                      textEditingController: _bookletName,
                      hintText: "Booklet Name",
                      filledField: true),
                  SizedBox(height: sizes.heightRatio * 20),
                  TextView.getRegularText("Date", Assets.poppinsRegular,
                      color: AppColors.blackColor, lines: 1),
                  SizedBox(height: sizes.heightRatio * 10),
                  CommonWidgets.getDateField(
                      date: filterDate != null
                          ? "${filterDate.day}/${filterDate.month}/${filterDate.year}"
                          : " Select Date",
                      onPressDate: () {
                        _showDate();
                      }),
                  SizedBox(height: sizes.heightRatio * 200),
                  CommonWidgets.getBottomButton(
                      text: Strings.applyText,
                      width: sizes.width,
                      margin: sizes.width* 0.001,
                      onPress: () {
                        _pendingTasksProvider.getTasks(context: context,
                            bookletName: _bookletName.text,
                            date: filterDate.toString(),
                            isFilter: true,
                            refresh: false
                        );
                      }),
                  SizedBox(height: sizes.heightRatio * 20),

                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  _showDate() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      //firstDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(
            cursorColor: Colors.grey,
            dialogBackgroundColor: Colors.white,
            colorScheme: ColorScheme.light(primary: AppColors.blueColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            highlightColor: Colors.grey[400],
            textSelectionColor: Colors.grey,
          ),
          child: child,
        );
      },
    );
    if (date != null) {
      setState(() {
        print('datetime is');
        print(date);
        filterDate = date;
      });
    } else {
      ApplicationToast.getWarningToast(
          durationTime: 3,
          heading: "Information",
          subHeading:
              "No Date has been selected, by default current date is filled above");
    }
  }
}
