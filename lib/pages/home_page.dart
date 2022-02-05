import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:patterns_scoped/model/post_model.dart';
import 'package:patterns_scoped/pages/create_page.dart';
import 'package:patterns_scoped/scopes/home_scoped.dart';
import 'package:patterns_scoped/views/item_of_post.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  static final String id="home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeScoped scoped = new HomeScoped();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scoped.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scoped Model"),
          centerTitle: true,
        ),
        body: ScopedModel<HomeScoped>(
          model: scoped,
          child: ScopedModelDescendant<HomeScoped>(
            builder: (context, child, model){
              return Stack(
                children: [
                  ListView.builder(
                    itemCount: scoped.items.length,
                    itemBuilder: (ctx, index) {
                      return itemOfPost(scoped, scoped.items[index],ctx);
                    },
                  ),
                  scoped.isLoading
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : SizedBox.shrink(),
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, CreatePage.id);
          },
          child: Icon(Icons.add),
        ),
    );
  }

}