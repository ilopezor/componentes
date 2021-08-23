import 'package:flutter/material.dart';

class HomePagesTemp extends StatelessWidget {

  final opciones = ['Unos','Dos','tres','cuatro','cinco'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('Temp')
      ),
      body: ListView(
        children:_createItemsShort()
      ),
    );
  }

  // List<Widget> _createItems(){

  //   List<Widget> list =  [];

  //   for(String item in opciones){
  //     final temWidget = ListTile(
  //       title: Text(item),
  //     );
  //     list..add(temWidget)
  //         ..add(Divider());
  //   }
  //   return list;
  // }

  List<Widget> _createItemsShort(){

    return opciones.map((e) { 
      return Column(
        children: [
          ListTile(
            title: Text(e),
          ),
          Divider()
        ],
      );
    }).toList();
  }
}