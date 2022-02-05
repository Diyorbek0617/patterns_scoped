import 'package:flutter/material.dart';
import 'package:patterns_scoped/scopes/update_scoped.dart';
import 'package:scoped_model/scoped_model.dart';

class UpdatePage extends StatefulWidget {
  static final String id = 'update_page';

  String title, body;
  UpdatePage({this.title, this.body, Key key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  UpdateScoped scoped = UpdateScoped();

  @override
  void initState() {
    super.initState();

    scoped.titleTextEditingController.text = widget.title;
    scoped.bodyTextEditingController.text = widget.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update page'),
        centerTitle: true,
      ),
      body: ScopedModel<UpdateScoped>(
        model: scoped,
        child: ScopedModelDescendant<UpdateScoped>(
          builder: (ctx, model, index) => Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Title
                      Container(
                        height: 70,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey,
                        ),
                        child: TextField(
                          controller: scoped.titleTextEditingController,
                          style: TextStyle(fontSize: 20,color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Title',
                            labelStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),

                      // Content
                      Container(
                        height: 300,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey,
                        ),
                        child: TextField(
                          controller: scoped.bodyTextEditingController,
                          style: TextStyle(fontSize: 18,color: Colors.white),
                          maxLines: 80,
                          decoration: InputDecoration(
                            labelText: 'content',
                            labelStyle: TextStyle(color: Colors.white),

                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      FlatButton(
                        onPressed: (){ scoped.apiPostUpdate(context);},
                        color: Colors.blue,
                        height: 45,
                        minWidth: double.infinity,
                        child: Text("Update",style: TextStyle(color: Colors.white,fontSize: 20),),
                      ),
                    ],
                  ),
                ),
              ),

              scoped.isLoading ? Center(child: CircularProgressIndicator(),) : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
