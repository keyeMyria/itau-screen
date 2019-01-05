import 'package:flutter/material.dart';

import 'cards/conta_corrente/conta_corrente_card.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[_buildTopTile(), _buildConteudo()],
        ),
        bottomNavigationBar: _buildBottomNavigator());
  }

  Widget _buildTopTile() {
    return Material(
      child: Container(
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
            children: <Widget>[
              Text("ag 0001"),
              SizedBox(
                width: 15,
              ),
              Text("c/c 00000-0")
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.notifications_none,
                color: Colors.orangeAccent,
                size: 25,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.search,
                color: Colors.orangeAccent,
                size: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConteudo() {
    return Expanded(
      child: Container(
        color: Color.fromRGBO(238, 233, 229, 1),
        child: ListView(
          children: <Widget>[
            ContaCorrenteCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigator() {
    return Container(
      color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.home,
              color: Colors.orange,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.short_text,
                color: Colors.white,
              ),
              Text(
                "extrato",
                style: TextStyle(color: Colors.white, fontSize: 13),
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.attach_money,
                color: Colors.white,
              ),
              Text(
                "transacoes",
                style: TextStyle(color: Colors.white, fontSize: 13),
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.storage,
                color: Colors.white,
              ),
              Text(
                "serviços",
                style: TextStyle(color: Colors.white, fontSize: 13),
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.question_answer,
                color: Colors.white,
              ),
              Text(
                "ajuda",
                style: TextStyle(color: Colors.white, fontSize: 13),
              )
            ],
          ),
        ],
      ),
    );
  }
}
