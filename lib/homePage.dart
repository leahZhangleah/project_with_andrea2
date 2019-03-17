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
  String name = "";
  List<Widget> children;
  GlobalKey<FormState> formKey = new GlobalKey();
  FocusNode _focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    children = <Widget>[
      buildInputWidget(),
    ];
    if(name.length!=0){
      print('The new name is: '+ name);
      children.add(buildCircularAvatar(name));
    }


    children.addAll(<Widget>[
      new Expanded(
          child: new Container(),
      ),
      new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new FlatButton(
              onPressed: _clearInputAndGetFocus,
              child: new Text('Clear'))
        ],
      )
    ]);

    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Get an image of your name'),
      ),
      body: Container(
        child: new Column(
          //mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      )
    );
  }

  void validateInput(String input){
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      print(input);
      setState(() {
      });
    }
  }

  void _clearInputAndGetFocus(){
    formKey.currentState.reset();
    FocusScope.of(context).requestFocus(_focusNode);

  }

  Widget buildInputWidget(){
    return new Form(
        key: formKey,
        child: new TextFormField(
          focusNode: _focusNode,
          decoration: new InputDecoration(
            hintText: 'Please enter a name',
            labelText: 'Name',
            labelStyle: new TextStyle(
              fontSize: 20.0,
            )
          ),
          textCapitalization: TextCapitalization.characters,
          validator: (value)=> value.isEmpty? 'Name can not be empty': null,
          onSaved: (value)=> name = value,
          onFieldSubmitted: (value)=>validateInput(value),
        )
    );
  }

  Widget buildCircularAvatar(String input){
    return new Avatar(input);
  }


}