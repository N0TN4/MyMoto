import 'package:mymoto/Modelos/moto.dart';

class Usuario {
  String id;
  String login;
  String nome;
  String senha;
  String email;
  String linkFoto;
  String cpf;
  String telefone;
  String confirmarSenha;
  Moto moto;
  String modelo;

  /// usuario tem moto.
  ///
  Usuario(
      {this.id,
      this.login,
      this.nome,
      this.senha,
      this.email,
      this.linkFoto,
      this.cpf,
      this.telefone,
      this.confirmarSenha,
      this.modelo});

  Usuario.firebase({this.id, this.nome, this.email, this.linkFoto});
}
