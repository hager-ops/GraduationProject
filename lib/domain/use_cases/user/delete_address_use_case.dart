import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosofe_app/common/firebase_keys/firebase_keys.dart';
import 'package:ecosofe_app/common/utils/app_snackbars.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DeleteAddressUseCase {
  final user = FirebaseAuth.instance.currentUser;
  Future<bool> execute(context, String id) async {
    try {
      DocumentReference usersRef = FirebaseFirestore.instance
          .collection(FireBaseUserKeys.userCollection)
          .doc(user?.email);
      await usersRef.collection(FireBaseUserKeys.address).doc(id).delete();
      AppSnackBars.success(context, title: 'Address Deleted');
      return true;
    } on FirebaseAuthException catch (e) {
      AppSnackBars.error(context, title: e.code.replaceAll('-', ' '));
    } catch (e) {
      AppSnackBars.error(context, title: e.toString());
    }
    return false;
  }
}
