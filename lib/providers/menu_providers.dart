import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {

  List<dynamic> menu = [];

  _MenuProvider(){
    // getData();
  }

 Future <List<dynamic>> getData() async {
    final res = await rootBundle.loadString('lib/data/menu_opts.json');

        Map dataMap = json.decode(res);
        print(dataMap);
        menu = dataMap['rutas'];

        return menu;
 }
}

final menuProviders = new _MenuProvider();