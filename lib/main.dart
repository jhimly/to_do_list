import 'package:flutter/material.dart';

void main() {
  runApp(

      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyStatefulWidget(),
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          accentColor: Colors.blueAccent,
          brightness: Brightness.dark,
        ),
      )
  );
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  List list = new List();
  String input = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Text("The list of things that needs to be completed today :",style: TextStyle(color: Colors.tealAccent),);
    list.add("Exerscise");
    list.add("Run");
    list.add("Walk Snowy");
    list.add("Read LOTR");
    list.add("Learn Mandarin");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List",textDirection: TextDirection.ltr,),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            print("Float!");
            showDialog(

                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Add toDo"),
                    content: TextField(
                      onChanged: (String value) {
                          input = value;
                      },
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("Add"),
                        onPressed: (){
                          setState(() {
                            list.add(input);
                          });
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                }
            );
          }
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible (
              key: Key(list[index]),
              child: ListTile(
                title: Text(list[index]),
              ),
              onDismissed: (direction) {
                list.removeAt(index);
              },
            );
          }
      ),
    );
  }
}
