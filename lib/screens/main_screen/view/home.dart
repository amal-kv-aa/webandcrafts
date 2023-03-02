import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webandcraft/screens/dummy_Screens/view/dummy_screen.dart';
import 'package:webandcraft/screens/home/view/home.dart';
import 'package:webandcraft/screens/main_screen/provider/main_provider.dart';
import 'package:webandcraft/screens/main_screen/view/widget/bottomnavigation/bottom_nav.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});
 final pageview =[ const Home(),const Seconde(),const Third(),const Foruth()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.teal,
      body:pageview[context.watch<MainProvider>().currendIndex],
     bottomNavigationBar:  const CustomBottomNav()
    );
  }
}



