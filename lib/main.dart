import 'package:flutter/material.dart';
import 'MytestApp.dart';
void main(){

  runApp(new MaterialApp(
   // theme: new ThemeData.light(),
    routes: <String , WidgetBuilder>{

      "/Page" :(BuildContext context)=> new Page()

    },

    home: MyApp(),
  )


  );
}

