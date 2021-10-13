import 'package:HCIProjectLab/ui/tabbedLayout.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Builder(builder: (context) {
              return Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                      key: _formkey,
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          _welcomeDisplay(),
                          _tfUsername(),
                          _tfPassword(),
                          _btnLogin(context),
                          Padding(
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)
                          ),
                        ],
                      )
                  )
              );
            }
        )
    );
  }

  //Sini

  Widget _welcomeDisplay(){
    return Container(
      child: Text(
        'WELCOME',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold
        ),
      ),
      margin: EdgeInsets.fromLTRB(0, 100, 0, 100),
    );
  }

  String value;

  Widget _tfUsername() {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
            // labelText: "Username", Opsi
            hintText: "Username",
            suffixIcon: Icon(Icons.account_circle),
            border: OutlineInputBorder()
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'please fill your username';
          }
          if (value.length < 5 || value.length > 20) {
            return 'username length must between 5 to 20';
          }
          if (value.toString().contains(' ')) {
            return 'username must not contain space';
          }
          return null;
        },
        onChanged: (text){
          value = text;
        },
      ),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
    );
  }

  Widget _tfPassword() {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "Password",
            suffixIcon: Icon(Icons.no_encryption_gmailerrorred_rounded),
            border: OutlineInputBorder()),
        validator: (value) {
          if (value.isEmpty) {
            return 'please fill your password';
          }
          return null;
        },
        obscureText: true,
      ),
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
    );
  }

  Widget _btnLogin(context) {
    return Container(
        child: RaisedButton(
          onPressed: () {
            if (!_formkey.currentState.validate()) {
              return;
            } else {

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => tabbedLayout(value : value)),
                (Route<dynamic> route) => false
              );
              
            }
          }, //activity homepage
          child: SizedBox(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Text(
                    'LOGIN',
                    textAlign: TextAlign.center,
                  )
                ],
              )),
        ),
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0));
  }
}
