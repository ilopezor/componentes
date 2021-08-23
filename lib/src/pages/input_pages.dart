
import 'package:flutter/material.dart';

class InputPages extends StatefulWidget {
  InputPages({Key? key}) : super(key: key);

  @override
  _InputPagesState createState() => _InputPagesState();
}

class _InputPagesState extends State<InputPages> {

  String _name = '';
  String _email = '';
  String _date = '';
  String _optionSelect = 'Volar';

  List _powers = ['Volar','Fuerza','Rayos X', 'Super Soplo','Super Velocidad'];

  TextEditingController _inputDate = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Input Text'),
       ),
       body: ListView(
         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
         children: <Widget>[
           _createInput(),
           Divider(),
           _createEmail(),
           Divider(),
           _createPasssword(),
           Divider(),
           _createDate(context),
           Divider(),
           _createDropdown(),
           Divider(),
           _createPersons(),
         ],
       )
    );
  }
  
  Widget _createInput() {
    return TextField(
      // autofocus:true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letras ${_name.length}'),
        hintText: 'Nombre',
        labelText: 'Nombre',
        helperText: 'Solo el Nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){
        setState(() {
        _name = valor;
        });
      },
    );
  }
  
  Widget _createEmail() {
    return TextField(
      // autofocus:true,
      keyboardType:  TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'example@example.com',
        labelText: 'Email',
        // helperText: 'Solo el Nombre',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (valor)=> setState(() =>_email = valor),
    );
  }
  
  Widget _createDate(BuildContext context) {
    return TextField(
      // autofocus:true,
      enableInteractiveSelection: false,
      controller: _inputDate,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Fecha de Nacimiento',
        labelText: 'Fecha de Nacimiento',
        // helperText: 'Solo el Nombre',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }
  
  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2018), 
      lastDate: new DateTime(2027),
      locale: Locale('es', 'ES')
    );

    if(picked != null){
      setState((){
        _date = picked.toString();
        _inputDate.text = _date;
      });
    } 
  }

  Widget _createPasssword() {
    return TextField(
      // autofocus:true,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'example@example.com',
        labelText: 'Email',
        // helperText: 'Solo el Nombre',
        suffixIcon: Icon(Icons.lock),
        icon: Icon(Icons.lock)
      ),
      onChanged: (valor)=> setState(() =>_email = valor),
    );
  }

  Widget _createDropdown() {
    return DropdownButton(
      value: _optionSelect,
      items: getOptionsDropdown(),
      onChanged: (option){
         setState(() {
           _optionSelect = option.toString();
         });
      }
    );
  }

  List<DropdownMenuItem<String>> getOptionsDropdown() {
    List<DropdownMenuItem<String>> list = [];

     _powers.map((e) {
       list.add(DropdownMenuItem(
        child: Text(e),
        value:e
      ));
    }).toList();

    if(list.length > 0){
      return list;
    }else{
      list.add(DropdownMenuItem(
          child: Text('No hay poderes'),
          value:'No hay poderes'
      ));
      return list;
    }
  }  

  Widget _createPersons(){
    return ListTile(
      title: Text('Nombre es: $_name'),
      subtitle: Text('Email es: $_email')
    );
  }
}

