import 'package:floward_flutter/provider/userlistscreenprovider.dart';
import 'package:floward_flutter/service/locationservice.dart';
import 'package:floward_flutter/view/timeline.dart';
import 'package:floward_flutter/view/userlist.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialise translator
  await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/lang/',
  );

  getCurrentLocation();

  /// Run MyApp as child of LocalizedApp
  runApp(
    LocalizedApp(
      child: const MyApp(),

    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: UserListScreen.PAGE,
        title: 'AppTitle'.tr(),
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        localizationsDelegates: translator.delegates,
        locale: translator.activeLocale,
        supportedLocales: translator.locals(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case UserListScreen.PAGE:
              return MaterialPageRoute(builder: (context) {
                return ChangeNotifierProvider(
                  create: (_) => UserProvider(),
                  child: const UserListScreen(),
                );
              });

            case TimeLineScreen.PAGE:
              TimeLineScreen timeLineObj = settings.arguments as TimeLineScreen;
              return MaterialPageRoute(builder: (context) {
                return TimeLineScreen(
                  userData: timeLineObj.userData,
                );
              });
            default:
              return MaterialPageRoute(builder: (context) {
                return ChangeNotifierProvider(
                  create: (_) => UserProvider(),
                  child: const UserListScreen(),
                );
              });
          }
        });
  }
}
