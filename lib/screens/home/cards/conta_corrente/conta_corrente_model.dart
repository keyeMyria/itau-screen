class ContaCorrenteModel{
  double saldo;
  double limite; 

  bool get isUsandoLimite => (limite ?? 0) >= (saldo ?? 0);

  ContaCorrenteModel({this.saldo, this.limite});
}