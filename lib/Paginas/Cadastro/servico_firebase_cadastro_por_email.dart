import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mymoto/Modelos/usuario.dart';

class ServicoFirebaseCadastroPorEmail {
  salvar(Usuario usuario) {
    Firestore.instance.collection("usuarios").document().setData({
      'login': usuario.login,
      'nome': usuario.nome,
      'senha': usuario.senha,
      'email': usuario.email,
      //'confirmarSenha': usuario.confirmarSenha,
      'telefone': "usuario.telefone",
      'modelo': usuario.moto.modelo,
      'marca': usuario.moto.marca,
      'quilometragem': usuario.moto.quiometragem
    });
  }
}
