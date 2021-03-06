import 'package:flutter/material.dart';
import 'package:flutter_app/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0','1','2','3','4'];

  // form values
  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text('Update your brew settings.',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Name'),
            validator: (val) => val.isEmpty ? 'Enter a Name' : null,
            onChanged: (val) {
              setState(() => _currentName = val );
            },
          ),
          SizedBox(height: 20),
          // dropdown
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _currentSugars ?? '0',
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text('$sugar sugars'),
              );
            }).toList(),
            onChanged: (val) {
              setState(() => _currentSugars = val );
            },
          ),
          // slider
          Slider(
            value: (_currentStrength ?? 100).toDouble(),
            activeColor: Colors.brown[_currentStrength ?? 100],
            inactiveColor: Colors.brown[_currentStrength ?? 100],
            min: 100,
            max: 900,
            divisions: 8,
            onChanged: (val) => setState( () => _currentStrength = val.round()),


          ),
          RaisedButton(
              color: Colors.pink[400],
              child: Text('Update', style: TextStyle(color: Colors.white),),
              onPressed: () async {
                print(_currentName);
                print(_currentSugars);
                print(_currentStrength);
              }
          )


        ],
      )
    );
  }
}
