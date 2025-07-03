import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  FirebaseAuth auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(auth.authStateChanges());
  }

  Future<void> signUp(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("Sucesso", "Usuário criado com sucesso");
    } catch (e) {
      Get.snackbar("Erro", e.toString());
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Sucesso", "Login realizado com sucesso");
    } catch (e) {
      Get.snackbar("Erro", e.toString());
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
    Get.snackbar("Logout", "Sessão encerrada");
  }

  bool isLoggedIn() {
    return firebaseUser.value != null;
  }
}
