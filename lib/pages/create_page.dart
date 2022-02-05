import 'package:flutter/material.dart';
import 'package:patterns_scoped/scopes/create_scoped.dart';

class CreatePage extends StatefulWidget {
  static final String id = 'create_page';

  const CreatePage({Key key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  CreateScoped scoped = CreateScoped();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create post'),
        centerTitle: true,
      ),
      body: Stack(
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
                    child: Center(
                      child: TextField(
                        controller: scoped.titleTextEditingController,
                        style: TextStyle(color: Colors.white,fontSize: 20),
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),

                  // content
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
                        labelText: 'Content',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  FlatButton(
                    onPressed: (){ scoped.apiPostCreate(context);},
                    color: Colors.blue,
                    height: 45,
                    minWidth: double.infinity,
                    child: Text("Create",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                ],
              ),
            ),
          ),

          scoped.isLoading ? Center(child: CircularProgressIndicator(),) : SizedBox.shrink(),
        ],
      ),
    );
  }
}
