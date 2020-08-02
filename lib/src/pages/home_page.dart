import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:juice_app/src/models/category_madel.dart';
import 'package:juice_app/src/providers/jugos_provider.dart';
import 'package:juice_app/src/widgets/swiper_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




  int currentIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<String> jugos = [
    'https://www.vidactual.com/reto/wp-content/uploads/2018/10/Jugo-de-fresa.jpg',
    'https://dam.cocinafacil.com.mx/wp-content/uploads/2020/01/jugo-de-naranja.jpg',
    'https://s1.eestatic.com/2015/02/27/cocinillas/Cocinillas_14258621_115818010_1024x576.jpg',
    'https://www.convivirpress.com/wp-content/uploads/2018/04/Sidra-de-manzana-casera.jpg',
    'https://unaricareceta.com/wp-content/uploads/2020/06/jugo-de-pera.jpg',
    'https://unaricareceta.com/wp-content/uploads/2020/06/agua-de-coco.jpg',
    'https://selecciones.com.mx/wp-content/uploads/2017/10/JUVA-PORT00.jpg',
  ];


  List<Category> categories = [
    Category(

      'Fresa',
      '🍓',
    ),
    Category(
      'Naranja',
      '🍊',
    ),
    Category(

      'Coco',
      '🥥',
    ),
    Category(

      'Kiwi',
      '🥝',
    ),
    Category(

      'Manzana',
      '🍎',
    ),
    Category(

      'Uva',
      '🍇',
    ),
    Category(

      'Pera',
      '🍐',
    )
  ];

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

  
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'JuiceApp',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          actions: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CircleAvatar(
                child: Image(
                  image: NetworkImage(
                      'https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/girl_avatar_child_kid-512.png'),
                ),
              ),
            )
          ],
          elevation: 0,
        ),
  
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal:20),
                  height: 150,
                  child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: listado()),
                ),
                Container( padding: EdgeInsets.only(top: 0, bottom: 20, left: 20),child: Text('Most Popular', style: TextStyle(color: Colors.white, fontSize: 18),)),
                _lista(size)

              ],
            )
          ],
        )
    ));
  }

  List<Widget> listado() {
    List<Widget> frutasLista = [];
    categories.forEach((fruta) {
      frutasLista.add(_frutaItem(fruta.name, fruta.icon));
      setState(() {});
    });
    return frutasLista;
  }

  Widget _frutaItem(String texto, String icon) {
    return Container(
        height: 75,
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 75,
        child: CircleAvatar(
          backgroundColor: Theme.of(context).accentColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                icon,
                style: TextStyle(fontSize: 32),
              ),
              Text(
                texto,
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
        ));
  }


  Widget _lista(Size size) {
    return FutureBuilder(
      future: jugosProvider.cagarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        final jugos  = snapshot.data;
        return SwiperWidget(
          jugos: jugos,
        );
      },
    );

    // return ListView(
    //   children: _crearListaItems()
    // );
    
  }

  
}
