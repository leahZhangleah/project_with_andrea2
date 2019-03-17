import 'package:flutter/material.dart';
import 'avatar.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _homePageState();
  }
}

class _homePageState extends State<HomePage>{
  //String name = "";
  List<Widget> children = <Widget>[];
  GlobalKey<FormState> formKey = new GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    children.add(buildInputWidget());
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Get an image of your name'),
      ),
      body: new Column(
        children: children,
      )
    );
  }

  void validateInput(String input){
    if(formKey.currentState.validate()){
      //formKey.currentState.save();
      print(input);
      if(input!=null){
        setState(() {
          children.add(buildCircularAvatar(input));
        });
      }
    }
  }

  Widget buildInputWidget(){
    return new Form(
        key: formKey,
        child: new TextFormField(
          decoration: new InputDecoration(
            hintText: 'Please enter a name',
            labelText: 'Name',
            labelStyle: new TextStyle(
              fontSize: 20.0,
            )
          ),
          textCapitalization: TextCapitalization.characters,
          validator: (value)=> value.isEmpty? 'Name can not be empty': null,
          //onSaved: (value)=> name = value,
          onFieldSubmitted: (value)=>validateInput(value),
        )
    );
  }

  Widget buildCircularAvatar(String input){
    return new Avatar(input);
  }


}