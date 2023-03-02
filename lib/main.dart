import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:webandcraft/screens/home/provider/home_provider.dart';
import 'package:webandcraft/screens/main_screen/provider/main_provider.dart';
import 'package:webandcraft/screens/main_screen/view/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('Datas');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MainProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => HomeProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, index) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: MainScreen(),
        );
      },
      designSize: const Size(374, 812),
    );
  }
}
