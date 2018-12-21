import 'package:flutter/material.dart';

void main() => runApp(MyForm());

class MyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form Widget
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
class _LoginData {
  String comCode = '';
  String expressNum = '';
}
// Create a corresponding State class. This class will hold the data related to
// the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();
  _LoginData _data = new _LoginData();
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.phone_android),
              hintText: 'What is the com code?',
              labelText: 'comCode *',
            ),
            onSaved: (String value) {
              this._data.comCode = value;
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String value) {
              return value.contains('@') ? 'Do not use the @ char.' : null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.blur_on),
              hintText: 'What is the express number',
              labelText: 'Number *',
            ),
            onSaved: (String value) {
              this._data.expressNum = value;
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter express number';
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, we want to show a Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                  _formKey.currentState.save();
                  print('Printing the login data.');
                  print('Phone: ${_data.comCode}');
                  print('Name: ${_data.expressNum}');
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}