import 'package:flutter/material.dart';

import '../enum/auth_mode.dart';

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  AuthMode _authMode = AuthMode.Login;
  final _passwordController = TextEditingController();

  final Map<String, String> _authData = {
    "email": "",
    "password": "",
  };

void _submit(){

}

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: 320,
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty || !value.contains("@")) {
                    return "Informe um e-mail válido";
                  }
                  if (value.isEmpty || !value.contains(".com")) {
                    return "Informe um e-mail válido";
                  }
                  return null;
                },
                onSaved: (value) => _authData["email"] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Senha"),
                controller: _passwordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value.isEmpty || value.length < 5) {
                    return "Informe uma senha válida";
                  }
                  return null;
                },
                onSaved: (value) => _authData["password"] = value,
              ),
              if (_authMode == AuthMode.Signup)
                TextFormField(
                  decoration: InputDecoration(labelText: "Confirmar Senha"),
                  controller: _passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: _authMode == AuthMode.Signup
                      ? (value) {
                          if (value != _passwordController.text) {
                            return "Informe uma senha válida";
                          }
                          return null;
                        }
                      : null,
                  onSaved: (value) => _authData["password"] = value,
                ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).primaryTextTheme.button.color,
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 8.0,
                ),
                child: Text(
                  _authMode == AuthMode.Login
                      ? "Entrar".toUpperCase()
                      : "Registrar".toUpperCase(),
                ),
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
