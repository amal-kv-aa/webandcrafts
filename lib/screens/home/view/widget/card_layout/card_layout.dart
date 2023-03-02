import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webandcraft/screens/detailspage/view/details.dart';
import 'package:webandcraft/screens/home/model/home_model.dart';

class CardLayout extends StatelessWidget {
  const CardLayout({
    super.key,
    required this.data
  });
 final EmployeesModel data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DetailsPage(data: data)))),
                       
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 5.h),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(91, 0, 0, 0),
                  offset: Offset(4, 5),
                  blurRadius: 5,
                ),
              ],
              image: const DecorationImage(image: AssetImage("assets/fc8e1a6afd3e7aeb419f10450a093769.jpg"),fit: BoxFit.cover),
              backgroundBlendMode: BlendMode.multiply,
              color: Colors.black),
          child: Column(
            children: [
              SizedBox(height: 10.h,),
              Expanded(
                  flex: 7,
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: const [BoxShadow(color: Color.fromARGB(130, 0, 0, 0),blurRadius: 10,spreadRadius: 5)],
                          image:  DecorationImage(
                              image: NetworkImage(
                                  data.profileImage ?? "https://tse2.mm.bing.net/th?id=OIP.o5hnVgDkhrAIKPAUMAtzcAHaHa&pid=Api&P=0"),
                              fit: BoxFit.fitHeight)))),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                  flex: 1,
                child:Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.w),
                  child: Text(data.name.toString(),
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w400,color: Colors.white),
                            ),
                ),),
                SizedBox(height: 5.h,),
                Expanded(
                  flex: 1,
                child:Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.w),
                  child: Text(data.company?.name ?? "",
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w400,color: Colors.white60),
                            ),
                ),), SizedBox(height: 10.h,),
            ],
          ),
        ),
      ),
    );
  }
}
