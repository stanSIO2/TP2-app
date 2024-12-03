import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon _coeur = Icon(Icons.favorite_border, color: Colors.white,);
  bool _likeBool = false;
  int _selectedIndex = 0;
  String _text = 'Ecran N°1';
  
  void _itemClique(int index){
    setState(() {
      _selectedIndex = index;
      switch(_selectedIndex){
        case 0:
        {
          _text = '$_selectedIndex : Ecran 1';
          Color: Colors.green;
        }

        case 1:
        {
          _text = '$_selectedIndex : Ecran 2';
        }
      }
    });
  }

  void _likeThis(){
    setState(() {
      if (_likeBool){
        _coeur = Icon(Icons.favorite_border, color: Colors.white,);
        bool _likeBool = false;
      }
      else {
        _coeur = Icon(Icons.favorite, color: Colors.white,);
        bool _likeBool = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
            actions: <Widget>[
              IconButton(onPressed: _likeThis, icon: _coeur)
          ],
          backgroundColor: Colors.red,
          ),
          floatingActionButton:(onPressed: (){
            Navigator.push
              context,
              MaterialPageRoute(
                Builder: (BuildContext context) => MysecondPage(Title : (widget.title))))
            }
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,// This trailing comma makes auto-formatting nicer for build methods.
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 0, 0),
                  ),
                  child: Text('Menu'),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Ecran 1'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Ecran 2'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_text),
              ],
            ),
          ),
    );
          
  }
}