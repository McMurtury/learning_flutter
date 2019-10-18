import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //String username = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(
        // This is the theme of your application.
        //Below sets the background and header colors.
        brightness: Brightness.dark,
        primaryColor: Colors.red,
          //primarySwatch: Colors.red,
        accentColor: Colors.amberAccent
        //backgroundColor: Colors.blueAccent,
        //This changes the text color.
        /*textTheme: TextTheme(
          body1: TextStyle(),
          body2: TextStyle(),
        ).apply(
          bodyColor: Colors.amberAccent,
          displayColor: Colors.black
        )*/
      ),
      home: MainPage(),//MyHomePage(title: 'Home Page'),
    );
  }
}

class MainPage extends StatelessWidget {
  //final List<Widget> options = new List<Widget>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: ListView(
        children: <Widget>[
        Card(child: ListTile(title: Text('Viewable list sample'),
        onTap:(){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GenListDisplay(entries: List<String>.generate(25, (i) => "Entry $i"),)),);})),
        Card(
          child: ListTile(
            title: Text('Data input sample'),
            onTap:(){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InputName()),);}
          ),
        ),
      ],
      )
      /*Center(
        child: RaisedButton(
          child: Text("Sample Data input"),
          onPressed: (){
            Navigator.push(
              context,
              //MaterialPageRoute(builder: (context) => GenListDisplay(entries: List<String>.generate(25, (i) => "Entry $i"),)),
                MaterialPageRoute(builder: (context) => InputName()),
            );
          },
        ),
      )*/,
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text('Back')
        ),
      ),
    );
  }
}

//generated strings to display a scrollable list.
class GenListDisplay extends StatelessWidget {
  final List<String> entries;
  GenListDisplay({Key key, @required this.entries}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final title = 'Viewable Long list';
    return Scaffold(
        appBar: AppBar(title: Text(title),
        ),
        body: ListView.builder(
          itemCount: entries.length,
          itemBuilder: (context, index){
            return ListTile(title: Text('${entries[index]}'),
            );
          },
        ),
      );
  }
}

class InputName extends StatefulWidget {
  @override
  InputPageState createState() => new InputPageState();
}
class InputPageState extends State<InputName> {
  String username = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Data'),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(hintText: 'Data'),
              onChanged: (String textinput) {
                setState((){
                  username = textinput;
                });
              },
            ),
            new Text(username),
          ],
        ),
    ));
  }
}