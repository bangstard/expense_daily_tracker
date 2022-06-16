import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../services/local_storage_user.dart';
import '../services/firestore_user.dart';
import '../../model/user_model.dart';
import '../../view/control_view.dart';

class AuthViewModel extends GetxController {
  String? email, password, name;

  final Rxn<User>? _user = Rxn<User>();

  String? get user => _user?.value?.email;

  final _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    _user!.bindStream(_auth.authStateChanges());
  }

  void signUpWithEmailAndPassword() async {
    try {
      // await _auth
      //     .createUserWithEmailAndPassword(email: email!, password: password!)
      //     .then((user) {
      //   saveUser(user);
      // });
      UserModel _userModel = UserModel(
        name: name!,
        email: email!,
        password: password!,
      );
      saveUser(
        UserModel(name: name!, email: email!, password: password!,),
      );
      Get.offAll(ControlView());
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to login..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((user) {
        FirestoreUser().getUserFromFirestore(user.user!.uid).then((doc) {
          saveUserLocal(
              UserModel.fromJson(doc.data() as Map<dynamic, dynamic>));
        });
      });
      Get.offAll(ControlView());
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to login..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      LocalStorageUser.clearUserData();
    } catch (error) {
      print(error);
    }
  }

  void saveUser(UserModel _user) async {
    UserModel _userModel = UserModel(
      name: _user.name,
      email: _user.email,
      password: _user.password,
    );
    // FirestoreUser().addUserToFirestore(_userModel);
    saveUserLocal(_userModel);
  }

  void saveUserLocal(UserModel userModel) async {
    LocalStorageUser.setUserData(userModel);
  }
}
