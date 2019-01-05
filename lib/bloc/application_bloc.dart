import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class ApplicationBloc extends BlocBase {
  var _logandoController = BehaviorSubject<bool>(seedValue: false);
  Stream<bool> get outLogando => _logandoController.stream;

  var _acessouController = BehaviorSubject<bool>(seedValue: false);
  Stream<bool> get outAcessou => _acessouController.stream;

  void acessar(String pass) {
    _logandoController.add(true);
    Future.delayed(
      Duration(seconds: 2),
      () {
        _logandoController.add(false);
        _acessouController.add(true);
      },
    );
  }

  @override
  void dispose() {
    _logandoController.close();
    _acessouController.close();
  }
}
