import 'package:flutter/material.dart';

class AvatarPages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar"),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(2.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://dam.esquirelat.com/wp-content/uploads/2020/07/STANLEE.jpg'),
              radius: 30.0
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
              
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image:NetworkImage('https://www.elheraldo.co/sites/default/files/articulo/2018/11/12/000_1as6xk.jpg'),
          placeholder: AssetImage('lib/assets/loading-2.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}