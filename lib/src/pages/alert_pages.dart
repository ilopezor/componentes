import 'package:flutter/material.dart';

class AlertPages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert")
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showAlert(context),
          child: Text('Mostrar Alerta'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape: StadiumBorder(),
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_return),
        onPressed: (){
          Navigator.pop(context);
        },
      ) ,
    );
  }

  void _showAlert(BuildContext context){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0) 
          ),
          title: Text('Alerta'),
          content:Column(
            mainAxisSize: MainAxisSize.min,
            children:<Widget>[
              Text('Hola jajajajaajajaja'),
              FlutterLogo(size: 100.0)
            ]
          ),
          actions: <Widget>[
            TextButton(
                onPressed: ()=> Navigator.of(context).pop(), 
                child: Text('Cancelar')
            ),
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: Text('ok')
            )
          ],
        );
      },
      barrierDismissible: true,
    );
  }
}