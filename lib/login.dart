import 'package:flutter/material.dart';
import 'package:qualif/global.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Image(
              image: AssetImage('images/logo.jpg')
            ),
            TextFormField(
              onChanged: (text) => Global.username = text,
              decoration: InputDecoration(hintText: 'Username'),
              validator: (String? input) {
                if (input == null || input.isEmpty) {
                  return "Username cannot be empty";
                }

                return null;
              },
            ),
            TextFormField(
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
                validator: (String? input) {
                  if (input == null || input.length < 4) {
                    return 'Password length cannot be less than 4';
                  }

                  if (!input.contains(new RegExp('[0-9]'))) {
                    return 'Password must contains at least a number';
                  }

                  return null;
                }),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                if (!_formkey.currentState!.validate()) {
                  return;
                }

                Navigator.popAndPushNamed(context, "/home");
              },
            )
          ],
        ),
      )
    )
  );
}
