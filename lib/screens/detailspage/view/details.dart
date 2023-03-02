import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webandcraft/screens/detailspage/view/widget/item/item.dart';
import 'package:webandcraft/screens/home/model/home_model.dart';
import 'package:webandcraft/widgets/bg_container/bg_container.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.data});
  final EmployeesModel data;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1300));
    togle();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double maxSlide = 300;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: BgContainer(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            final slide = maxSlide * animationController.value;
            return Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(width: 5),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://i.pinimg.com/564x/fc/8e/1a/fc8e1a6afd3e7aeb419f10450a093769.jpg"),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      children: [
                        const Expanded(flex: 1, child: SizedBox()),
                        Expanded(
                            flex: 7,
                            child: Container(
                                width: slide,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromARGB(130, 0, 0, 0),
                                          blurRadius: 10,
                                          spreadRadius: 5)
                                    ],
                                    image: DecorationImage(
                                        image: NetworkImage(widget
                                                .data.profileImage ??
                                            "https://tse2.mm.bing.net/th?id=OIP.o5hnVgDkhrAIKPAUMAtzcAHaHa&pid=Api&P=0"),
                                        fit: BoxFit.fitHeight)))),
                        SizedBox(
                          height: 10.h,
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                              widget.data.name.toString(),
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    children:  [
                      SizedBox(height: 10.h,),
                      Items(name: "User name", value: ": ${widget.data.username??"not available"}"),
                      Items(name: "Email", value: ": ${widget.data.email??"not available"}"),
                      Items(name: "phone number", value: ": ${widget.data.phone??"not available"}"),
                      Items(name: "Company", value: ": ${widget.data.company?.name??"not available"}"),
                      Items(name: "City", value: ": ${widget.data.address?.city??"not available"}"),
                      Items(name: "Street", value: ": ${widget.data.address?.street??"not available"}"),
                    ]
                  )
                )
              ],
            );
          },
        ),
      ),
    );
  }

  togle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();
}
