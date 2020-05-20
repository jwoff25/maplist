import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  InputForm({Key key}) : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Location"),
      ),
      body: Builder(builder: (context) {
        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(validator: (value) {
                if (value.isEmpty) {
                  return "This is a required field.";
                }
                return null;
              }),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Processing'),
                    ));
                  }
                },
                child: Text('Submit'),
              )
            ],
          ),
        );
      }),
    );
  }
}
