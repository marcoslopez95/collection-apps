//region imports
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:access_maketicket/defaultTheme/screen/DTSignUpScreen.dart';
import 'package:access_maketicket/firebase_options.dart';
import 'package:access_maketicket/fullApps/cloudStorage/model/CSDataModel.dart';
import 'package:access_maketicket/fullApps/stockMarket/screens/signup_screen.dart';
import 'package:access_maketicket/locale/AppLocalizations.dart';
import 'package:access_maketicket/main/screens/AppSplashScreen.dart';
import 'package:access_maketicket/main/store/AppStore.dart';
import 'package:access_maketicket/main/utils/AppTheme.dart';
import 'package:access_maketicket/main/utils/flutter_web_frame/flutter_web_frame.dart';
import 'package:access_maketicket/routes.dart';
import 'package:access_maketicket/workingApps/chatGPTMailGeneration/utils/common.dart';

import 'locale/Languages.dart';
import 'main/utils/AppConstant.dart';
import 'main/utils/AppDataProvider.dart';
import 'main/utils/app_scroll_behaviour.dart';
//endregion

/// This variable is used to get dynamic colors when theme mode is changed
AppStore appStore = AppStore();

List<CSDataModel> getCloudBoxList = getCloudboxData();
List<CSDrawerModel> getCSDrawerList = getCSDrawer();
int currentIndex = 0;
BaseLanguage? language;

// RemoteConfigDataModel remoteConfigDataModel = RemoteConfigDataModel();

late String darkMapStyle;
late String lightMapStyle;

void main() async {
  //region Entry Point
  WidgetsFlutterBinding.ensureInitialized();

  await initialize(aLocaleLanguageList: languageList());

  // Stripe.publishableKey = STRIPE_PAYMENT_PUBLISH`_KEY;

  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));
  await appStore.setLanguage(getStringAsync(SELECTED_LANGUAGE_CODE, defaultValue: defaultLanguage));

  darkMapStyle = await rootBundle.loadString('assets/mapStyles/dark.json');
  lightMapStyle = await rootBundle.loadString('assets/mapStyles/light.json');

  defaultRadius = 10;
  defaultToastGravityGlobal = ToastGravity.BOTTOM;
  if (isWeb) {
    maxScreenWidth = 475.0;
  }

  if (isMobile || isWeb) {
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) {
      if (isMobile) {
        // MobileAds.instance.initialize();
      }
      setupFirebaseRemoteConfig();
      // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    });

    if (isMobile) {
      try {
        OneSignal.initialize(OneSignalId);
        OneSignal.Notifications.requestPermission(true);
      } catch (e) {
        print('${e.toString()}');
      }
      OneSignal.consentRequired(true);

      OneSignal.Notifications.addForegroundWillDisplayListener((event) {
        OneSignal.Notifications.displayNotification(event.notification.notificationId);
        return event.notification.display();
      });
    }
  }

  runApp(MyApp());
  //endregion
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      maximumSize: Size(475.0, 812.0),
      enabled: kIsWeb,
      builder: (context) {
        return Observer(
          builder: (_) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: '$mainAppName${!isMobile ? ' ${platformName()}' : ''}',
            home: DTSignUpScreen(),
            theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
            // initialRoute: '/event',
            // initialRoute: AppSplashScreen.tag,
            routes: routes(),
            // onGenerateInitialRoutes: (route) => [
            //   MaterialPageRoute(builder: (_) => AppSplashScreen(routeName: route.validate())),
            // ],
            navigatorKey: navigatorKey,
            scrollBehavior: AppScrollBehavior(),
            supportedLocales: LanguageDataModel.languageLocales(),
            localizationsDelegates: [
              AppLocalizations(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) => locale,
            locale: Locale(appStore.selectedLanguageCode),
          ),
        );
      },
    );
  }
}
