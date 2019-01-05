import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

import 'conta_corrente_model.dart';

class ContaCorrenteBloc extends BlocBase {
  var _dadosCard = BehaviorSubject<ContaCorrenteModel>();
  Stream<ContaCorrenteModel> get outDadosCard => _dadosCard.stream;

  var _dadosCardIsLoading = BehaviorSubject<bool>(seedValue: false);
  Stream<bool> get outDadosCardIsLoading => _dadosCardIsLoading.stream;

  //Negócio
  Future<void> onExpandirButtonClick() async {
    _dadosCardIsLoading.add(true);
    if (_dadosCard.value == null) {
      //Buscar dados
      await Future.delayed(Duration(seconds: 2));
      //Registrar dados
      _dadosCard.add(ContaCorrenteModel(limite: 5000, saldo: 15423.28));
    } else {
      _dadosCard.add(null);
    }
    _dadosCardIsLoading.add(false);
  }

  void toggleSaldo() {
    double novoSaldo = _dadosCard.value.saldo > 4000 ? 4000 : 23000;
    _dadosCard.add(ContaCorrenteModel(saldo: novoSaldo, limite: 5000.00));
  }

  @override
  void dispose() {
    _dadosCard.close();
    _dadosCardIsLoading.close();
  }
}
