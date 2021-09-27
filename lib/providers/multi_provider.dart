
import 'package:etma_demo/screens/PendingBooklet/pendingBookletProvider.dart';
import 'package:etma_demo/screens/PendingTasks/PendingTasksProvider.dart';
import 'package:etma_demo/screens/booklet/booklet_provider.dart';
import 'package:etma_demo/screens/booklet_detail/bookletDetail_provider.dart';
import 'package:etma_demo/screens/splash/splash_provider.dart';
import 'package:etma_demo/screens/welcome/welcome_provider.dart';
import 'package:provider/provider.dart';

final multiProviders = [
  ChangeNotifierProvider<SplashProvider>(
    create: (_) => SplashProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<WelcomeProvider>(
    create: (_) => WelcomeProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<BookletProvider>(
    create: (_) => BookletProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<BookletDetailProvider>(
    create: (_) => BookletDetailProvider(),
    lazy: true,
  ),

  ChangeNotifierProvider<PendingBookletProvider>(
    create: (_) => PendingBookletProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<PendingTasksProvider>(
    create: (_) => PendingTasksProvider(),
    lazy: true,
  ),

];
