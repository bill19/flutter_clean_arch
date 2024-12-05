import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/config/app_config.dart';
import 'package:flutter_clean_arch/routes/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    return ScreenUtilInit(
      designSize: AppConfig.screenSize,
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        onGenerateTitle: (context) => AppLocalizations.of(context).title,
        showPerformanceOverlay: false,
        locale: const Locale('zh', 'CH'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: _router.config(),
      ),
    );
  }
}
