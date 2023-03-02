import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Items extends StatelessWidget {
  const Items(
      {super.key, required this.name, required this.value, this.widget});
  final String name;
  final String value;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Expanded(
            flex: 2,
            child: SizedBox(
            ),
          ),
          Expanded(flex: 3, child: Text(name,style: const TextStyle(fontWeight: FontWeight.w700),)),
          SizedBox(
            width: 5.w,
          ),
          Expanded(flex: 6, child: Text(value,style: const TextStyle(fontWeight: FontWeight.w700),)),
          const Expanded(
            flex: 2,
            child: SizedBox(
            ),
          ),
        ],
      ),
    );
  }
}
