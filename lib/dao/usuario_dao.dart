import 'package:sistema_gerenciamento_estoque/entidade/gerenciador.dart';
import 'package:sistema_gerenciamento_estoque/entidade/usuario.dart';

class UsuarioDao {
  List<Usuario> usuarios = [];

  String adicionar(Usuario usuarioInserir) {
    try {
      var existe = false;
      for (var i = 0; i < usuarios.length; i++) {
        var usuario = usuarios[i];
        if (usuarioInserir.nome == usuario.nome) {
          usuario.nome = usuarioInserir.nome;
          usuario.cpf = usuarioInserir.cpf;
          usuario.email = usuarioInserir.email;
          usuario.senha = usuarioInserir.senha;
          usuario.telefone = usuarioInserir.telefone;
          existe = true;
          break;
        }
      }
      if (!existe) {
        usuarios.add(usuarioInserir);
      }
      return "Usuário cadastrado com sucesso!";
    } catch (e) {
      throw Exception('Erro ao cadastrar usuário');
    }
  }

  Usuario? getUsuario(int id) {
    for (var i = 0; i < usuarios.length; i++) {
      if (usuarios[i].id == id) {
        return usuarios[i];
        break;
      }
    }
    return null;
  }
}
