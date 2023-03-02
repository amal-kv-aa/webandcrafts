import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:webandcraft/screens/home/provider/home_provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 2.h,right: 20.w),
        child: SizedBox(
            height: 60.h,
            width: 250.h,
            child: TextField(
              controller: context.watch<HomeProvider>().controller,
              textAlign: TextAlign.left,
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              onSubmitted: (value) {
                if (value.isEmpty) {
                  return;
                }
                context.read<HomeProvider>().serach(context);
              }
              ,
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                if (value.isEmpty) {
               context.read<HomeProvider>().loadDatas();
                }
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10.w),
                fillColor: const Color.fromARGB(255, 232, 232, 232).withOpacity(0.5),
                filled: true,
                hintText: 'search employee...',
                suffixIcon: IconButton(
                    onPressed: () {
                      context.read<HomeProvider>().serach(context);
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white38,
                    )),
                hintStyle: TextStyle(color: Colors.white70, fontSize: 14.sp),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: Color.fromARGB(255, 244, 244, 244)),
                    borderRadius: BorderRadius.circular(10.r)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(10.r)),
              ),
            )),
      ),
    );
  }
}
