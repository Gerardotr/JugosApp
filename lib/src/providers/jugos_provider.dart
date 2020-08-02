import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _JugoProvider {

  List<dynamic> opciones = [];

  _JugoProvider() {
    //cagarData();
  }

   Future<List<dynamic>>cagarData() async  {

     final res = await rootBundle.loadString('data/jugos.json');
     
      Map dataMap = json.decode(res);
      opciones = dataMap['jugos'];

      return opciones;
     
      
   }
}

final jugosProvider = new _JugoProvider();