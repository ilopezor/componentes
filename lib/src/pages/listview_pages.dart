import 'dart:async';

import 'package:flutter/material.dart';

class ListPages extends StatefulWidget {
  ListPages({Key? key}) : super(key: key);

  @override
  _ListPagesState createState() => _ListPagesState();
}

class _ListPagesState extends State<ListPages> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listNumbers = [];
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() { 
    super.initState();
    _addImage();

    _scrollController..addListener(() {
      if(_scrollController.position.pixels == (_scrollController.position.maxScrollExtent)){
        // _addImage();
        _fetchtData();
      }
    });
  }

  @override
  void dispose() {
  
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('List'),
       ),
       body: Stack(
         children: <Widget>[
           _createLoading(),
           _createList(),
         ],
      ),
       
    );
  }

  Widget _createList(){
    return RefreshIndicator(
      onRefresh: _firstPages,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listNumbers.length,
        itemBuilder: (BuildContext context, buildIndex){
          final image = _listNumbers[buildIndex];
          return FadeInImage(
            // height: 250.0,
            fit: BoxFit.contain,
            placeholder: AssetImage('lib/assets/loading-2.gif'),
            image: NetworkImage('https://picsum.photos/200/300?random=$image')
           );
        },
      ),
    );
  }

  Future<Null> _firstPages() async {
    final duration = Duration(seconds: 2);
    new Timer (duration,(){
      _listNumbers.clear();
      _lastItem++;
      _addImage();
    });

    return Future.delayed(duration);
  } 

  void _addImage(){
    for (var i = 0; i < 10; i++) {
      _lastItem ++;
      _listNumbers.add(_lastItem);
    }

    setState(() {
      
    });
  }

  Future _fetchtData() async {
    setState(() {
    _isLoading = true;
    });

    final duration = new Duration(seconds: 2);
    
    new Timer(duration, resHttp);
  }

  void resHttp(){
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    _addImage();
  }

  Widget _createLoading(){
    
    if(_isLoading){

      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children:<Widget> [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
            CircularProgressIndicator()
            ]
          ),
          SizedBox(height:30.0)
        ],
      );
      // return CircularProgressIndicator();
    }else{
      return Container();
    }
  }
}