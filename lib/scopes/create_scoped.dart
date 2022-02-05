import 'dart:math';

import 'package:flutter/material.dart';
import 'package:patterns_scoped/model/post_model.dart';
import 'package:patterns_scoped/pages/home_page.dart';
import 'package:patterns_scoped/services/http_service.dart';
import 'package:scoped_model/scoped_model.dart';

class CreateScoped extends Model {
  bool isLoading = false;
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController bodyTextEditingController = TextEditingController();

  apiPostCreate(BuildContext context)  async {
    isLoading = true;
    notifyListeners();

    Post post = Post(title: titleTextEditingController.text, body: bodyTextEditingController.text, userId: Random().nextInt(pow(2, 30) - 1));

    var response = await Network.GET(Network.API_CREATE, Network.paramsCreate(post));

    if (response != null) {
      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
    }

    isLoading = false;
    notifyListeners();
    print(response);
  }
}