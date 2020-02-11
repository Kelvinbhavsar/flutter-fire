import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: ListView.builder(itemBuilder: (BuildContext context , int i){
              return Card(
                child: ListTile(
                  isThreeLine: true,
                  leading: Image.network("https://www.gstatic.com/webp/gallery/1.jpg"),
                  title: Text((i+1).toString()),
                  subtitle: Text("Let's start chat"),

                ),
              );
            },itemCount: 25,)
        ,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print(
          Firestore.instance.document('chat').get());
        },
        tooltip: 'Add New Chat',
        child: Icon(Icons.chat),
      ),
    );
  }
}
