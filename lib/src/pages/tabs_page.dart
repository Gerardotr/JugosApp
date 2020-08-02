import 'package:flutter/material.dart';
import 'package:juice_app/src/pages/agregar_page.dart';
import 'package:juice_app/src/pages/home_page.dart';
import 'package:juice_app/src/pages/profile_page.dart';



class TabsPage extends StatefulWidget {


  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {

  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            HomePage(),
            AgregarPage(),
            ProfilePage()

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(

        onTap: (index) {
          setState(() => _currentIndex = index);
          _pageController.animateToPage(_currentIndex, duration: Duration(milliseconds: 250), curve: Curves.easeInOut);

        },

       backgroundColor: Theme.of(context).primaryColor,
       selectedItemColor: Theme.of(context).accentColor,
       unselectedItemColor: Color.fromRGBO(183, 188, 201,1),
       currentIndex: _currentIndex, 
       // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           title: new Text('Inicio'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.add,),
           backgroundColor: Colors.pink,
           title: new Text('Agregar'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           title: Text('Perfil')
         )
       ],
     ),
    );
  }
}

