import 'package:flutter/material.dart';
// import 'package:flutter_application_demo_23_05/urltext.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.face)),
          ),
        ),
        drawer: My_Drawer(),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          children: [
            for (int i = 0; i < 60; i++) MyContainer(),
            // HyperlinkText('')
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            var MySnackBar = SnackBar(
              content: Text("thông báo bị ngu"),
              backgroundColor: Colors.blueAccent.shade200,
              duration: Duration(seconds: 1),
            );
            ScaffoldMessenger.of(context).showSnackBar(MySnackBar);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 100,
            padding: EdgeInsets.all(10),
          ),
        ));
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 110,
      width: 110,
      color: Colors.amber.shade900,
    );
  }
}

class My_Drawer extends StatefulWidget {
  const My_Drawer({
    super.key,
  });

  @override
  State<My_Drawer> createState() => _My_DrawerState();
}

class _My_DrawerState extends State<My_Drawer> {
  int _gioitinh = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 220,
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                foregroundColor: Color.fromRGBO(0, 0, 0, 0.004),
                animationDuration: Duration(milliseconds: 1),
                side: BorderSide(color: Colors.black)),
            onPressed: () {},
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.account_box_outlined,
                  size: 40,
                  color: Colors.black,
                ),
                Text(
                  "Information",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                side: BorderSide(color: Colors.black),
                animationDuration: Duration(microseconds: 1),
                shadowColor: Colors.black,
              ),
              onPressed: () {},
              child: Center(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.settings_applications_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                    Text(
                      "Setting account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              )),
          RadioListTile(
            title: Text("Nam"),
            secondary: Icon(Icons.male),
            selectedTileColor: Colors.amber.shade200,
            tileColor: Colors.cyan.shade200,
            activeColor: Colors.red,
            subtitle: Text("Male"),
            value: 0,
            groupValue: _gioitinh,
            onChanged: (value) {
              setState(() {
                _gioitinh = int.parse(value.toString());
              });
              print(_gioitinh);
            },
          ),
          RadioListTile(
            title: Text("Nu"),
            secondary: Icon(Icons.female),
            selectedTileColor: Colors.amber.shade200,
            tileColor: Colors.cyan.shade200,
            subtitle: Text("Female"),
            value: 1,
            groupValue: _gioitinh,
            onChanged: (value) {
              setState(() {
                _gioitinh = int.parse(value.toString());
              });
              print(_gioitinh);
            },
          ),
          TextButton(
              onPressed: () {},
              child: Column(
                children: [
                  Image.network('https://picsum.photos/250?image=9'),
                  Text("data")
                ],
              ))
        ],
      ),
    );
  }
}
