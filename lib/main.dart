import 'package:etma_demo/providers/multi_provider.dart';
import 'package:etma_demo/res/assets.dart';
import 'package:etma_demo/res/strings.dart';
import 'package:etma_demo/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  dynamic restartApp({BuildContext context}){
    final _MyAppState state = context.findAncestorStateOfType<State<MyApp>>();
    state.restartApp();
  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();



  void restartApp(){
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  void initState() {
    // configureFcm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return MultiProvider(
      providers: multiProviders,
      child: MaterialApp(
        key: key,
        title: Strings.appTitle,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: Assets.interMedium
        ),
        debugShowCheckedModeBanner: false,
        routes: Routes.routes,
        initialRoute: Routes.splash,
      ),
    );
  }
}


