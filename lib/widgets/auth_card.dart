import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/auth.dart';

import '../enum/auth_mode.dart';

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  GlobalKey<FormState> _form = GlobalKey();
  bool _isLoading = false;
  AuthMode _authMode = AuthMode.Login;
  final _passwordController = TextEditingController();

  final Map<String, String> _authData = {
    "email": "",
    "password": "",
  };

  Future<void> _submit() async {
    if (!_form.currentState.validate()) {
      return;
    }
    setState(() {
      _isLoading = true;
    });

    _form.currentState.save();

    Auth auth = Provider.of(context, listen: false);

    if (_authMode == AuthMode.Login) {
    } else {
      await auth.signup(
        _authData["email"],
        _authData["password"],
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _swichAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(
        () {
          _authMode = AuthMode.Signup;
        },
      );
    } else {
      if (_authMode == AuthMode.Signup) {
        setState(
          () {
            _authMode = AuthMode.Signup;
          },
        );
      }
    }
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
        height: _authMode == AuthMode.Login ? 290 : 371,
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _form,
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
                ),
              Spacer(),
              if (_isLoading)
                CircularProgressIndicator()
              else
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
              FlatButton(
                onPressed: _swichAuthMode,
                child: Text(
                    "ALTERNAR P/ ${_authMode == AuthMode.Login ? "REGISTRAR" : "LOGIN"}"),
                textColor: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
