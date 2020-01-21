import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mymoto/Modelos/usuario.dart';

class ServicoFirebase {
  // trocar para autenticação google
  // fazer autenticação.

  salvar(Usuario usuario) {
    // Para fazer: converter todas as variáveis do usuario para map, e print no setData
    // ao invés de por um por um.

    Firestore.instance.collection('usuarios').document().setData({
      'login': usuario.login,
      'nome': usuario.nome,
    });
  }
}
