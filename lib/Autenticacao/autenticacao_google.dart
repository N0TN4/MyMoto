import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mymoto/Modelos/usuario.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';

class AutenticacaoGoogle {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  
   Future<FirebaseUser> logarComGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    Usuario usuario = new Usuario(
      tokenUid: user.uid,
      nome: user.displayName,
      email: user.email,
      urlFoto: user.photoUrl,
      //telefone?
    );
    UsuarioLogado.usuario = usuario;

    return await _auth.currentUser();
  }
}
