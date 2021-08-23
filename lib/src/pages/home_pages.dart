import 'package:flutter/material.dart';

import 'package:componentes/providers/menu_providers.dart';
import 'package:componentes/src/utils/icono_string_util.dart';

class HomePages extends StatelessWidget{
   @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
      ),
      body: _list()
    );
  }

  Widget _list(){
    // print(menuProviders.menu);
    return FutureBuilder(
      future: menuProviders.getData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot){
        // snapshot.hasData;
        return ListView(
          children: _listItem(snapshot.data,context),
        );
      },
    );
    
  }


  List<Widget> _listItem(List<dynamic>? data, BuildContext context){
    // final List<Widget> menu = [];

    return data!.map((e) { 
      // print(e);
      return Column(
        children: [
          ListTile(
            title: Text(e['texto']),
            leading: getIcon(e['icon']),
            trailing: Icon(Icons.keyboard_arrow_right, color:Colors.blue),
            onTap: (){

              Navigator.pushNamed(context, e['ruta']);


              //Una forma rara
              // final route = MaterialPageRoute(
              //   builder:(context){
              //     return AlertPages();
              //   });
              // Navigator.push(context, route);
            }
          ),
          Divider(),
        ],
      );
    }).toList();
  
    
  }
}