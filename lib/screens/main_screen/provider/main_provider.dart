import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';
import 'package:webandcraft/screens/main_screen/view/widget/bottomnavigation/bottom_nav.dart';
import 'package:webandcraft/utils/rive/rive.dart';

class MainProvider with ChangeNotifier {
  
  ScrollController scrollController = ScrollController();
  int currendIndex = 0;
  updateIndex(int index) {
    currendIndex = index;
    notifyListeners();
  }

  getcontroller(Artboard artboard, RiveAssset riveList) {
    StateMachineController controller = RiveUtils.getRivecontroller(artboard,
        stateMachineName: riveList.stateMachineName);
    riveList.input = controller.findSMI("active") as SMIBool;
  }
}
