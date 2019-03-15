import 'package:flutter/material.dart';

class Avatar extends StatefulWidget{
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
        getAvatarWidget(),
        new Text('Courtesy of Robohash')
      ],
    );
  }
  
  Widget getAvatarWidget(){
    return new FutureBuilder(
      future: fetchAvatar(),
        builder: null
    );
  }

  Future fetchAvatar(){

  }
}