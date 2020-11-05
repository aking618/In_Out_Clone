import 'package:flutter/material.dart';
import 'package:in_out_clone/services/auth.dart';
import 'package:in_out_clone/shared/constants.dart';
import 'package:in_out_clone/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: timberwolf,
            appBar: AppBar(
              backgroundColor: deepSpaceSparkle,
              elevation: 0.0,
              title: Text('Sign into In-Out Board'),
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    label:
                        Text('Register', style: TextStyle(color: Colors.white)))
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (value) =>
                          value.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
                      validator: (value) => value.length < 6
                          ? 'Enter a password 6+ characters long'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      color: Colors.blue[800],
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          String result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          if (result != 'Success!') {
                            setState(() {
                              error = result;
                              loading = false;
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      error,
                      style: TextStyle(fontSize: 14.0, color: Colors.red),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
