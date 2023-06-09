import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosofe_app/common/firebase_keys/firebase_keys.dart';
import 'package:ecosofe_app/common/utils/app_snackbars.dart';
import 'package:ecosofe_app/domain/models/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SetUserInfoUseCase {
  final user = FirebaseAuth.instance.currentUser;

  Future<bool> execute(context, UserData user) async {
    try {
      DocumentReference usersRef = FirebaseFirestore.instance
          .collection(FireBaseUserKeys.userCollection)
          .doc(user.emailAddress);
      await usersRef.set(user.toMap(), SetOptions(merge: true));
      return true;
    } on FirebaseAuthException catch (e) {
      AppSnackBars.error(context, title: e.code.replaceAll('-', ' '));
    } catch (e) {
      AppSnackBars.error(context, title: e.toString());
    }
    return false;
  }
}
