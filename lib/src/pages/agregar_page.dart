import 'package:flutter/material.dart';
import 'package:juice_app/src/providers/jugos_provider.dart';

class AgregarPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: _lista()
      
    );
  }

   Widget _lista() {

    //menuProvider.cagarData();

    return FutureBuilder(
      future: jugosProvider.cagarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {

        final jugos  = snapshot.data;

        return   ListView.builder(
        itemCount: jugos.length,
        itemBuilder: (context, i) {


          return Container(
            margin: EdgeInsets.symmetric(vertical:10, horizontal: 10),
            child: Row(
              children: <Widget>[

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    height: 200,
                    fit: BoxFit.cover,
                    width: 150,
                    placeholder: AssetImage('assets/loading.gif'),
                    image: NetworkImage(jugos[i]['image']),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(jugos[i]['nombre'], style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Container(
                        height: 100,
                        width: 160,
                        child: Text(jugos[i]['descripcion'], style: TextStyle(color: Color.fromRGBO(183, 188, 201,1), fontSize: 14)),
                      ),
                       Row(
                      
                  children: <Widget>[


                    CircleAvatar(
                                             backgroundColor: Theme.of(context).accentColor,
                      child: Icon(Icons.remove, color: Colors.white,),
                    ),
                    Container(margin: EdgeInsets.all(10),child: Text('1', style: TextStyle(color: Colors.white),)),
                     CircleAvatar(
                       backgroundColor: Theme.of(context).accentColor,
                      child: Icon(Icons.add, color: Colors.white,),
                    )



                  ],
                )

                    ],
                  ),
                ),
                 
              

              ],
            ),
          );



        }
      );
      },
    );

    // return ListView(
    //   children: _crearListaItems()
    // );
    
  }
}