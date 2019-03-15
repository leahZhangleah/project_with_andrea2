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
  //String name;
  GlobalKey<FormState> formKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Get an image of your name'),
      ),
      body: buildInputWidget(),
    );
  }

  void validateInput(String input){
    if(formKey.currentState.validate()){
      //formKey.currentState.save();
      print(input);
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

  Widget buildCircularAvatar(){
    return new Avatar();
  }


}