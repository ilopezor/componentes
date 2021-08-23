import 'package:flutter/material.dart';


class CardPages extends StatelessWidget {
  const CardPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        // padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
        children: <Widget>[
          _cardType1(),
          SizedBox(height:30.0),
          _cardType2(),
        ],
      ),
    );
  }


  Widget _cardType1(){
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0) 
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading:  Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Tarjetas'),
            subtitle: Text('Album Familiar')
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: (){

                }, 
                child: Text('Cancelar')
              ),
              TextButton(
                onPressed: (){

                }, 
                child: Text('Ok')
              ),
            ]
          )
      ],)
    );
  }

  Widget _cardType2(){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0) 
      ) ,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[

          FadeInImage(
            placeholder: AssetImage('lib/assets/loading-2.gif'),
             image: NetworkImage('https://images.hdqwalls.com/wallpapers/bthumb/landscape-reflection-lake-full-hd.jpg'),
             height: 250.0,
             fit: BoxFit.cover,
             fadeInDuration: Duration(milliseconds: 200),
          ),

          // Image(
          //   image: NetworkImage('https://images.hdqwalls.com/wallpapers/bthumb/landscape-reflection-lake-full-hd.jpg'),
          //   //Image from: https://hdqwalls.com/landscape-reflection-lake-full-hd-wallpaper
          // ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Noche Estrellada')
          )
        ]
      )
    );


    //Por si el clipBehavior no funciona
    // return Container(
    //   decoration: BoxDecoration(
    //     borderRadius:  BorderRadius.circular(30.0),
    //     color: Colors.white,
    //     boxShadow: <BoxShadow>[
    //       BoxShadow(
    //         color: Colors.black26,
    //         blurRadius: 10.0,
    //         spreadRadius: 2.0,
    //         offset: Offset(2.0, 10.0)
    //       )
    //     ]
    //   ),
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(30.0),
    //     child: card
    //   ),
    // );
    
  }

}