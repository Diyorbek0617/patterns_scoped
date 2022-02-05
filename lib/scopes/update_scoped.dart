import 'dart:math';

import 'package:flutter/material.dart';
import 'package:patterns_scoped/model/post_model.dart';
import 'package:patterns_scoped/pages/home_page.dart';
import 'package:patterns_scoped/services/http_service.dart';
import 'package:scoped_model/scoped_model.dart';

class UpdateScoped extends Model {
  bool isLoading = false;
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController bodyTextEditingController = TextEditingController();

  apiPostUpdate(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    Post post = Post(id: Random().nextInt(pow(2, 30) - 1),title: titleTextEditingController.text, body: bodyTextEditingController.text, userId: Random().nextInt(pow(2, 30) - 1));

    var response = await Network.PUT(Network.API_UPDATE + '1', Network.paramsUpdate(post));

    if (response != null) {
      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
    }

    isLoading = false;
    notifyListeners();
    print(response);
  }

}