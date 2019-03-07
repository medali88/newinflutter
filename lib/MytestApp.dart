import 'package:flutter/material.dart';
import 'dart:math';
import 'package:device_info/device_info.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


var _theme = new ThemeData(primarySwatch: Colors.red , buttonColor: Colors.blue); // applique un théme


class _MyAppState extends State<MyApp> {
  List<String> mat = ["x", "y", "z"];
  String mathtext = "Math";
  String infoDevice = "device info";
  var textsize = 30.0;

  void incsize() {
    setState(() {
      textsize++;
    });
  }

  void getText() {
    setState(() {
      mathtext = mat[new Random().nextInt(mat.length)];
    });
  }

  getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    var v = androidInfo.brand;
    setState(() {
      infoDevice = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Theme(data: _theme,
      child: new Scaffold(

        drawer: new Drawer(child: new ListView(children: <Widget>[

          new DrawerHeader(child: new Text("c'est moi")),
          new ListTile(title: new Text("Table des matiéres") ,
                         subtitle: new Text("liste des matiéres") ,
            onTap: (){},
leading: new Icon(Icons.book),
trailing: new Switch(value: true, onChanged: null),
          ),

          new ListTile(title: new Text("menu") ,
            subtitle: new Text("liste des matiéres") ,
            onTap: (){},
            leading: new Icon(Icons.menu),
            trailing: new Switch(value: true, onChanged: null),
          ),

          new ListTile(title: new Text("Configuration") ,
            subtitle: new Text("liste des matiéres") ,
            onTap: (){},
            leading: new Icon(Icons.update),
            trailing: new Switch(value: true, onChanged: null),
          ),

new AboutListTile(child: new Text("About your book"),)
          
        ],),),


        bottomNavigationBar: new BottomNavigationBar(items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(icon: new Icon(Icons.search) ,title: new Text("recherche")),
          new BottomNavigationBarItem(icon: new Icon(Icons.home) ,title: new Text("Acceuil")),
          new BottomNavigationBarItem(icon: new Icon(Icons.info) ,title: new Text("info")),

        ]),



        //backgroundColor: Colors.white70,
      /*  bottomNavigationBar: new BottomAppBar(
          color: Colors.greenAccent,
          child: new Container(
              child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Copyright"),
              new Icon(Icons.copyright),
              new Text("2019")
            ],
          )),
        ),*/

        appBar: new AppBar(
          title: new Row(
            children: <Widget>[new Icon(Icons.home), new Text("Test app")],

          ),

          actions: <Widget>[
            new Icon(Icons.add)
          ],
        ),

floatingActionButton: new FloatingActionButton(onPressed: null),

        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,

          //alignement de text
          children: <Widget>[

            new TextField(),

            new RaisedButton(
              onPressed: getDeviceInfo,
              child: new Text("Get Device Info"),
            ),
            new Row(
              children: <Widget>[
              new RaisedButton( child:  MyCard("$mathtext", Icons.assessment, Colors.blue, textsize), onPressed: (){
                Navigator.pushNamed(context, "/Page");

                //Navigator.push(context, new MaterialPageRoute(builder: (context)=>new Page()));
              },),
                InkWell(onTap: incsize, child: new Icon(Icons.search)),
                new RaisedButton(
                    child: new Icon(Icons.add, size: 25.0), onPressed: getText)
              ],
            ),
            new Row(
              children: <Widget>[
               new RaisedButton( child: MyCard("Physique", Icons.account_balance_wallet, Colors.red,
                    textsize) , onPressed: (){
                 Navigator.push(context, new MaterialPageRoute(builder: (context)=>new Page()));


               },),


                InkWell(onTap: incsize, child: new Icon(Icons.search)),
                new RaisedButton(
                    child: new Icon(Icons.add, size: 25.0), onPressed: getText)
              ],
            ),
            new Row(
              children: <Widget>[
               new RaisedButton(child: MyCard("Technique", Icons.access_time, Colors.amber, 40.0) , onPressed: (){
                 Navigator.push(context, new MaterialPageRoute(builder: (context)=>new Page()));

               },),
                InkWell(onTap: incsize, child: new Icon(Icons.search)),
                new RaisedButton(
                    child: new Icon(Icons.add, size: 25.0), onPressed: getText)
              ],
            ),
            new Text(
              infoDevice,
              textAlign: TextAlign.center,
            ),

               new Image.asset("assets/pics/androidios.jpg" )



            
          ],
        ),


      ),
    );
  }
}

Card MyCard(String Mytext, IconData Myicon, Color Mycolor, num x) {
  return new Card(
      child: Padding(
    padding: const EdgeInsets.all(18.0),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
          Myicon,
          size: 40.0,
        ),
        new Text(Mytext, style: new TextStyle(fontSize: x, color: Mycolor))
      ],
    ),
  ));
}
 class Page extends StatelessWidget {

   @override
   @override
   Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(),
       body: new Center(child: new Text("Physique"),),

     );
   }


 }
