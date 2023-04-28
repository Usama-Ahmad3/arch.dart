import 'package:docter_app/view/hospital/textFormFieldProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'utils/colors/colors.dart';
import 'utils/routing/routeNames.dart';
import 'utils/routing/routes.dart';

GetIt getIt = GetIt.instance;

Future<void> main() async {
  getIt.registerLazySingleton<textFormField>(() => textFormField());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => textFormField()..getUser()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: FlexColor.deepPurpleLightTertiary,
          accentIconTheme: const IconThemeData(
            color: FlexColor.greyLawLightIcon,
          ),
          textTheme: const TextTheme(
            headline1: TextStyle(color: FlexColor.black),
            headline2: TextStyle(color: FlexColor.lightSurfaceOrg),
          ),
          appBarTheme:
              const AppBarTheme(color: FlexColor.deepPurpleLightTertiary),
          dividerColor: FlexColor.greyLawDarkPrimaryContainer,
        ),
        initialRoute: RouteName.cleanPractice,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
