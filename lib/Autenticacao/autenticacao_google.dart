import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mymoto/Modelos/usuario.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';

class AutenticacaoGoogle {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  getCurrentUser() async {
    bool nulo = false;
    FirebaseUser _user = await FirebaseAuth.instance.currentUser();
    print(_user);
    if(_user == null){
      return nulo;
    }
    else{
      nulo = true;
      return nulo;
    }
    
    //print("User: ${_user.displayName ?? "None"}");
    //return nulo;
  }

  void logarComGoogle() async {
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

    final FirebaseUser currentUser = await _auth.currentUser();
    Usuario usuario = new Usuario.firebase(
      id: user.uid,
      nome: user.displayName,
      email: user.email,
      linkFoto: user.photoUrl,
      //telefone?
    );
    UsuarioLogado.usuario = usuario;

    assert(user.uid == currentUser.uid);
  }
}
