class Usuario {
  dynamic id;
  String nome;
  String email;
  String senha;
  String cpf;
  String telefone;
  String tipoUsuario;

  Usuario(
      {this.id,
      required this.nome,
      required this.email,
      required this.senha,
      required this.cpf,
      required this.telefone,
      required this.tipoUsuario});
}
