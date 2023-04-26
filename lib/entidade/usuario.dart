class Usuario {
  dynamic _id;
  String _nome;
  String _email;
  String _senha;
  String _cpf;
  String _telefone;

  Usuario({
    dynamic id,
    required String nome,
    required String email,
    required String senha,
    required String cpf,
    required String telefone,
  })  : _nome = nome,
        _email = email,
        _senha = senha,
        _cpf = cpf,
        _telefone = telefone;

  dynamic get id => _id;
  set id(dynamic value) => _id = value;

  String get nome => _nome;
  set nome(String value) => _nome = value;

  String get email => _email;
  set email(String value) => _email = value;

  String get senha => _senha;
  set senha(String value) => _senha = value;

  String get cpf => _cpf;
  set cpf(String value) => _cpf = value;

  String get telefone => _telefone;
  set telefone(String value) => _telefone = value;
}
