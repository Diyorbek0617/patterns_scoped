import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:patterns_scoped/model/post_model.dart';
import 'package:patterns_scoped/pages/update_page.dart';
import 'package:patterns_scoped/scopes/home_scoped.dart';

Widget itemOfPost(HomeScoped scoped ,Post post,BuildContext context) {

  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.25,
    child: Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title.toUpperCase(),
            style:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(post.body),
        ],
      ),
    ),
    actions: <Widget>[
      IconSlideAction(
        caption: 'Update',
        color: Colors.indigo,
        icon: Icons.edit,
        onTap: () {

        Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePage(title: post.title, body: post.body)));
        },
      ),
    ],
    secondaryActions: <Widget>[
      IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () {
          scoped.apiPostDelete(post).then((value) => {
            if(value) scoped.apiPostList(),
          });
        },
      ),
    ],
  );
}