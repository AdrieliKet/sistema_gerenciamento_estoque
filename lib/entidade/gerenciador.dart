import 'package:sistema_gerenciamento_estoque/entidade/usuario.dart';

class Gerenciador extends Usuario {
  dynamic id;

  Gerenciador({id, nome, email, senha, cpf, telefone, tipoUsuario})
      : super(
            id: id,
            nome: nome,
            email: email,
            senha: senha,
            cpf: cpf,
            telefone: telefone);

  String getPermissao() {
    return "gerenciador";
  }
}
