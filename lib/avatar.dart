import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Avatar extends StatefulWidget{
  String input;
  Avatar(this.input);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _avatarState();
  }
}

class _avatarState extends State<Avatar>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        getAvatarWidget(widget.input),
        new Text('Courtesy of Robohash')
      ],
    );
  }
  
  Widget getAvatarWidget(String input){
    return new FutureBuilder<Uint8List>(
      future: fetchAvatar(input),
        builder: (context,snapshot){
        if(snapshot.hasData){
          return new Image.memory(
            snapshot.data,
          );
        }else if(snapshot.hasError){
          print('${snapshot.error}');
          return new Center(
            child: new Text('❌',style: TextStyle(fontSize: 72.0),),
          );
        }
        return CircularProgressIndicator();
        }
    );
  }

  Future<Uint8List> fetchAvatar(String input) async {
    String url = 'https://robohash.org/'+input;
    print(url);
    final response = await http.get(url);
    if(response.statusCode == 200){
      return response.bodyBytes;
    }else{
      throw Exception('Failed to load image');
    }
  }

}