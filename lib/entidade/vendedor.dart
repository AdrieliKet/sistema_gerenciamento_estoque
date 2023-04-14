import 'package:sistema_gerenciamento_estoque/entidade/usuario.dart';

class Vendedor extends Usuario {


    Vendedor({id, nome, email, senha, cpf, telefone, tipoUsuario})
      : super(
            id: id,
            nome: nome,
            email: email,
            senha: senha,
            cpf: cpf,
            telefone: telefone);

  String getPermissao() {
    return "vendedor";
  }
}
