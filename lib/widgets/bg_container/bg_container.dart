import 'package:flutter/cupertino.dart';

class BgContainer extends StatelessWidget {
  const BgContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/43399b92721d95c5ef2bbb13f66712fa.jpg"),
                fit: BoxFit.cover)),
                 child: child,
                );
  }
}
