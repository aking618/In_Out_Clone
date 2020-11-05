import 'package:flutter/material.dart';
import 'package:in_out_clone/models/user.dart';
import 'package:in_out_clone/services/database.dart';
import 'package:in_out_clone/shared/constants.dart';
import 'package:in_out_clone/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();

  // form values
  String _currentName;
  String _currentTitle;
  String _currentLocation;
  String _currentTimeStamp;
  String _currentClockedIn;

  // date time
  DateTime now;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Update your employee settings',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      initialValue: userData.name,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Name'),
                      validator: (value) =>
                          value.isEmpty ? 'Please enter a name' : null,
                      onChanged: (value) =>
                          setState(() => _currentName = value),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      initialValue: userData.title,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Title'),
                      validator: (value) =>
                          value.isEmpty ? 'Please enter a title' : null,
                      onChanged: (value) =>
                          setState(() => _currentTitle = value),
                    ),
                    SizedBox(height: 20.0),
                    DropdownButtonFormField(
                      isExpanded: true,
                      decoration: textInputDecoration,
                      value: _currentLocation ?? userData.location,
                      items: locations.map((location) {
                        return DropdownMenuItem(
                          value: location,
                          child: Text(location),
                        );
                      }).toList(),
                      onChanged: (value) =>
                          setState(() => _currentLocation = value),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          color: cambridgeBlue,
                          child: Text(
                            'Clock In',
                            style: buttonTextStyle,
                          ),
                          onPressed: () =>
                              setState(() => _currentClockedIn = 'IN'),
                        ),
                        RaisedButton(
                          color: lightPink,
                          child: Text(
                            'Clock Out',
                            style: buttonTextStyle,
                          ),
                          onPressed: () =>
                              setState(() => _currentClockedIn = 'OUT'),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      color: Colors.blue[800],
                      child: Text(
                        'Update',
                        style: buttonTextStyle,
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          now = DateTime.now();
                          setState(() => _currentTimeStamp =
                              ('${now.month}/${now.day}/${now.year}  ${now.hour}:${now.minute}:${now.second}'));
                          await DatabaseService(uid: user.uid).updateUserData(
                            _currentName ?? userData.name,
                            _currentTitle ?? userData.title,
                            _currentLocation ?? userData.location,
                            _currentTimeStamp ?? userData.timeStamp,
                            _currentClockedIn ?? userData.clockedIn,
                          );
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
