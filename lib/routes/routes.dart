

import 'package:etma_demo/screens/booklet/booklet.dart';
import 'package:etma_demo/screens/splash/splash.dart';
import 'package:etma_demo/screens/welcome/welcome.dart';

class Routes {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String booklet = '/booklet';
  static const String bookletDetail = '/bookletDetail';
  static const String categoryTitle = '/categoryTitle';
  static const String task = '/task';



  static final routes = {
    splash: (context) => Splash(),
    welcome: (context) => Welcome(),
    booklet: (context) => Booklet(),
  };
}
