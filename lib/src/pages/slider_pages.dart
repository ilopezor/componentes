import 'package:flutter/material.dart';

class SliderPages extends StatefulWidget {
  SliderPages({Key? key}) : super(key: key);

  @override
  _SliderPagesState createState() => _SliderPagesState();
}

class _SliderPagesState extends State<SliderPages> {

  double _valueSlider =  200.0;
  bool _controlCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Slider')
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children:<Widget> [
            _createSlider(),
            _createCheckbox(),
            _createSwicht(),
            Expanded(child: _createImage())
          ],
        ),
      ),
    );    
  }

  Widget _createSlider() {

    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la Imagen',
      // divisions: 20,
      value: _valueSlider,
      min: 10.0,
      max:400.0,
      onChanged: (_controlCheck) ? null :  ( data ){
        setState(() {
        _valueSlider = data;
        });
      },
    );
  }

  Widget _createImage(){
    return FadeInImage(
            placeholder: AssetImage('lib/assets/loading-2.gif'),
             image: NetworkImage('https://images.alphacoders.com/180/thumb-1920-180561.jpg'),
             height: 250.0,
             fit: BoxFit.contain,
             fadeInDuration: Duration(milliseconds: 200),
             width: _valueSlider,
    );
  }

  Widget _createCheckbox(){

    // return Checkbox(
    //   value: _controlCheck,
    //   onChanged: (value){
    //     setState(() {
    //     _controlCheck = value!;
    //     });
    //   }
    // );

    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _controlCheck, 
      onChanged: (data){
        setState(() {
          _controlCheck = data!;
        });
      }
    );
  }

  Widget _createSwicht(){

    // return Checkbox(
    //   value: _controlCheck,
    //   onChanged: (value){
    //     setState(() {
    //     _controlCheck = value!;
    //     });
    //   }
    // );

    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _controlCheck, 
      onChanged: (data){
        setState(() {
          _controlCheck = data;
        });
      }
    );
  }

}