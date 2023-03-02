import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:webandcraft/screens/main_screen/provider/main_provider.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 15, 17, 16).withOpacity(0.8),
            borderRadius: BorderRadius.all(Radius.circular(24.r))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(
              riveList.length,
              (index) => Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    context.read<MainProvider>().updateIndex(index);
                    if (riveList[index].input != null) {
                      riveList[index].input!.change(true);
                      Future.delayed(const Duration(milliseconds: 200), () {
                        riveList[index].input!.change(false);
                      });
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
                        height:
                            index == context.watch<MainProvider>().currendIndex
                                ? 3.h
                                : 0,
                        width:
                            index == context.watch<MainProvider>().currendIndex
                                ? 50.w
                                : 0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 30,
                        width: 50,
                        child: Opacity(
                          opacity: index ==
                                  context.watch<MainProvider>().currendIndex
                              ? 1
                              : 0.5,
                          child: RiveAnimation.asset(
                            riveList.first.src,
                            artboard: riveList[index].artboard,
                            onInit: (artboard) {
                              log("called");
                              context
                                  .read<MainProvider>()
                                  .getcontroller(artboard, riveList[index]);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class RiveAssset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;
  RiveAssset({
    required this.src,
    required this.artboard,
    required this.stateMachineName,
    required this.title,
    this.input,
  });

  set setInput(SMIBool status) {
    input = status;
  }
}

final List<RiveAssset> riveList = [
  RiveAssset(
      src: "assets/1298-2487-animated-icon-set-1-color.riv",
      artboard: "HOME",
      stateMachineName: "HOME_Interactivity",
      title: "HOME"),
  RiveAssset(
      src: "assets/1298-2487-animated-icon-set-1-color.riv",
      artboard: "CHAT",
      stateMachineName: "CHAT_Interactivity",
      title: "CHAT"),
  RiveAssset(
      src: "assets/1298-2487-animated-icon-set-1-color.riv",
      artboard: "AUDIO",
      stateMachineName: "AUDIO_Interactivity",
      title: "AUDIO"),
  RiveAssset(
      src: "assets/1298-2487-animated-icon-set-1-color.riv",
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
      title: "USER")
];
