import 'package:flutter/material.dart';
import 'package:juice_app/src/pages/tabs_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'tabs',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(45, 45, 69,1),
        accentColor: Color.fromRGBO(243, 164, 177,1),
        
      ),
      routes: {
        'tabs': (BuildContext context) => TabsPage()
      }
      
    );
  }
}