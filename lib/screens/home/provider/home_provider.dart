import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:webandcraft/screens/home/model/home_model.dart';
import 'package:webandcraft/service/api_service/api_service.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider() {
    loadDatas();
  }
  List<EmployeesModel>? empoyessModel;
  bool isListview = false;
  Box box = Hive.box('Datas');
  TextEditingController controller = TextEditingController();

  void loadDatas() async {
    if (box.isEmpty) {
      final response = await ApiService().getEmployeesData();
      if (response != null) {
        log('in if');
        empoyessModel = apiModelFromJson(jsonEncode(response));
        notifyListeners();
        await storeToDB(response);
      }
    } else {
      log('from box');
      empoyessModel = apiModelFromJson(jsonEncode(box.values.toList()));
      notifyListeners();
    }
  }

  Future storeToDB(List list) async {
    await box.addAll(list);
    notifyListeners();
  }

  void updateView(bool value) {
    isListview = value;
    notifyListeners();
  }

  void serach(BuildContext context) {
    log(controller.text.toString());
    final searchList = apiModelFromJson(jsonEncode(box.values.toList()));
    final index = searchList.indexWhere((element) =>
        element.name!.toLowerCase().startsWith(controller.text.toLowerCase()) ||
        element.email!.toLowerCase().startsWith(controller.text.toLowerCase()));
    if (index >= 0) {
      empoyessModel = [searchList[index]];
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("no employee available")));
    }

    notifyListeners();
  }
}
