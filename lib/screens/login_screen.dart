import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import '../bloc/application_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() {
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  var _passController = TextEditingController();

  @override
  void dispose() {
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _buildTopTile(),
          _buildCenterTile(context),
          _buildBottomTile()
        ],
      ),
    );
  }

  Widget _buildTopTile() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        leading: CircleAvatar(
          backgroundColor: Colors.grey[200],
          radius: 20,
          child: Text(
            "DA",
            style: TextStyle(color: Colors.deepOrange, fontSize: 14),
          ),
        ),
        title: Text(
          "olá, David",
          style: TextStyle(color: Colors.deepOrange),
        ),
        subtitle: Row(
          children: <Widget>[Text("ag 0001"), SizedBox(width: 15,), Text("c/c 00000-0")],
        ),
        trailing: Icon(Icons.keyboard_arrow_down),
      ),
    );
  }

  Widget _buildCenterTile(context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.deepOrangeAccent[200], Colors.orange],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        width: double.infinity,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "senha eletrônica",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              IgnorePointer(
                child: Container(
                  width: 230,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: TextField(
                    controller: _passController,
                    decoration: InputDecoration(
                      fillColor: Colors.orange,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.white,
                        size: 20,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    obscureText: true,
                  ),
                ),
              ),
              _buildBotaoAcessar(context),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "esqueci minha senha",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBotaoAcessar(BuildContext context) {
    var bloc = BlocProvider.of<ApplicationBloc>(context);
    return StreamBuilder<bool>(
      stream: bloc.outLogando,
      builder: (context, snapshot) {
        return GestureDetector(
          onTap: () {
            bloc.acessar(_passController.text);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            width: 250,
            height: 50,
            child: Align(
                alignment: Alignment.center,
                child: snapshot.data ?? true
                    ? SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(),
                      )
                    : Text(
                        "acessar",
                        style: TextStyle(
                            fontSize: 17, color: Colors.deepOrangeAccent),
                      )),
          ),
        );
      },
    );
  }

  Widget _buildBottomTile() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
      color: Colors.orange,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(
                Icons.screen_share,
                color: Colors.white,
                size: 30,
              ),
              Text(
                "atahos",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.vpn_key,
                color: Colors.white,
                size: 30,
              ),
              Text(
                "iToken",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.help_outline,
                color: Colors.white,
                size: 30,
              ),
              Text(
                "ajuda",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}
