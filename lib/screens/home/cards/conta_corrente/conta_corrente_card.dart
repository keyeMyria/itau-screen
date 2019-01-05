import 'package:flutter/material.dart';

import 'conta_corrente_bloc.dart';
import 'conta_corrente_model.dart';

class ContaCorrenteCard extends StatefulWidget {
  @override
  ContaCorrenteCardState createState() {
    return new ContaCorrenteCardState();
  }
}

class ContaCorrenteCardState extends State<ContaCorrenteCard> {
  ContaCorrenteBloc bloc;

  @override
  void initState() {
    super.didChangeDependencies();
    bloc = ContaCorrenteBloc();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.only(left: 25, top: 25, right: 25),
              title: Text(
                "saldo em conta corrente",
                style: TextStyle(fontSize: 20),
              ),
              trailing: _buildBotaoExpandir(),
            ),
            _buildDataContainer(),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(25, 0, 0, 15),
              leading: Text(
                "ver extrato",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              trailing: _buildBotaoVerDetalhes(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBotaoExpandir() {
    return StreamBuilder<bool>(
      stream: bloc.outDadosCardIsLoading,
      builder: (context, snapshot) {
        return (snapshot?.data ?? true)
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(),
              )
            : StreamBuilder(
                stream: bloc.outDadosCard,
                builder: (_, snapshot) {
                  return InkWell(
                    onTap: () => bloc.onExpandirButtonClick(),
                    child: Container(
                      width: 70,
                      height: 40,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(snapshot.hasData ? "ocultar" : "expandir"),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 5),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
      },
    );
  }

  Widget _buildDataContainer() {
    return StreamBuilder<ContaCorrenteModel>(
      stream: bloc.outDadosCard,
      builder: (context, snapshot) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          height:
              snapshot.hasData ? (snapshot.data.isUsandoLimite ? 250 : 150) : 0,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: !snapshot.hasData
                ? Container()
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          (snapshot.data.isUsandoLimite ? "- " : "") +
                              "R\$ ${snapshot.data.saldo.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: snapshot.data.isUsandoLimite
                                ? Color.fromRGBO(182, 28, 28, 1)
                                : Colors.black,
                            fontSize: 23,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "cheque especial *",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                onPressed: bloc.toggleSaldo,
                                icon: Icon(
                                  Icons.info_outline,
                                  color: Colors.blue,
                                  size: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            "limite disponível*",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Text(
                          "R\$ ${snapshot.data.limite.toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 15),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            "*sujeito a encargos",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        !snapshot.data.isUsandoLimite
                            ? Container()
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color.fromRGBO(182, 28, 28, 1),
                                ),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.warning,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    "Você ultrapassou o seu limite e está sujeito a tarifa.",
                                    style: TextStyle(
                                        fontSize: 12.5, color: Colors.white),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }

  Widget _buildBotaoVerDetalhes() {
    return StreamBuilder<ContaCorrenteModel>(
      stream: bloc.outDadosCard,
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.only(right: 25),
          child: snapshot.hasData
              ? Text(
                  "ver detalhes",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                )
              : Container(),
        );
      },
    );
  }
}
