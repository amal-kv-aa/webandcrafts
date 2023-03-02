import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webandcraft/screens/home/model/home_model.dart';

class CoustomListTile extends StatelessWidget {
  const CoustomListTile({super.key, required this.data});
  final EmployeesModel data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
      child: SizedBox(
        height: 100.h,
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(156, 0, 0, 0),
                  offset: Offset(4, 5),
                  blurRadius: 5,
                ),
                BoxShadow(
                  color: Color.fromARGB(156, 0, 0, 0),
                  offset: Offset(2, 2),
                  blurRadius: 5,
                ),
              ],
              image: const DecorationImage(
                  image:
                      AssetImage("assets/fc8e1a6afd3e7aeb419f10450a093769.jpg"),
                  fit: BoxFit.cover),
              backgroundBlendMode: BlendMode.multiply,
              color: Colors.black),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                          image: DecorationImage(
                              image: NetworkImage(data.profileImage ??
                                  "https://tse2.mm.bing.net/th?id=OIP.o5hnVgDkhrAIKPAUMAtzcAHaHa&pid=Api&P=0"),
                              fit: BoxFit.cover)))),
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.h, vertical: 10.w),
                      child: Text(
                        data.name.toString(),
                        style: TextStyle(
                            fontSize: 16.sp,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      child: Text(
                        data.company?.name ?? "",
                        style: TextStyle(
                            fontSize: 12.sp,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.white60),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
